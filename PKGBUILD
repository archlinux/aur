# Maintainer: Gaute Hope <eg@gaute.vetsj.com>
pkgname=astroid
pkgver=0.10
pkgrel=1
epoch=
pkgdesc="a graphical threads-with-tags style, lightweight and fast, email client for notmuch, inspired by sup and others"
arch=('x86_64' 'i686')
url="https://github.com/astroidmail/astroid"
license=('GPL')
groups=()
depends=('notmuch' 'boost' 'boost-libs' 'gmime' 'gtkmm3' 'webkitgtk' 'libsass' 'libpeas' 'gobject-introspection')
makedepends=('scons' 'git' 'pkg-config' 'python-gobject')
checkdepends=('notmuch-runtime')
optdepends=('gvim: default editor'
            'emacs: can be used as editor'
            'vte3: for drop-down terminal')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=$pkgname.install
changelog=
source=(https://github.com/astroidmail/astroid/archive/v${pkgver}.tar.gz)
noextract=()
sha256sums=('ebf2385cb7dc1fe1b19b145e38e9c4b8ac2c45e7fb48b2d24077c1d762fb1862')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  scons --release="$pkgver" --prefix=/usr build
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  scons --release="$pkgver" --prefix=/usr test
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  scons --release="$pkgver" --install-sandbox="$pkgdir/" --prefix=/usr install
}

