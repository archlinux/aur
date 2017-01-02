# Maintainer: Gaute Hope <eg@gaute.vetsj.com>
pkgname=astroid
pkgver=0.7
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
            'emacs: can be used as editor')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://github.com/astroidmail/astroid/archive/v${pkgver}.tar.gz)
noextract=()
sha256sums=('0463995109aa1cec3da43fc1f20d9b0c2a9afd13580b3cc12081762b0374b19c')

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

