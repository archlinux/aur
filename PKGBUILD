# Maintainer: Jimmy <theotherjimmy[at]gmail[dot]com>
_pkgname=gmpmee
pkgname=${_pkgname}-git
pkgver=20140222.1dc0a1084d
pkgrel=1
pkgdesc="GMP modular exponent extension"
url="http://www.verificatum.com/verificatum/index.html"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('gmp' )
optdepends=()
makedepends=()
conflicts=(verificatum)
provides=(verificatum=1.0.8)
replaces=()
backup=()
install='gmpmee.install'
source=("verificatum::git+https://github.com/agoravoting/verificatum.git")
md5sums=('SKIP')

build() {
  cd "${srcdir}/verificatum/${_pkgname}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/verificatum/${_pkgname}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
