# Maintainer: aksr <aksr at t-com dot me>
pkgname=outils-git
pkgver=0.6.r8.g5f5e832
pkgrel=1
epoch=
pkgdesc="A port of some non-standard OpenBSD tools to Linux."
arch=('i686' 'x86_64')
url="https://github.com/chneukirchen/outils"
license=('custom')
groups=()
depends=('')
makedepends=('git' 'openssl')
optdepends=()
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/chneukirchen/outils")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

