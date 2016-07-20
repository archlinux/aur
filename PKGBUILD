# Maintainer: kfgz <kfgz at interia dot pl>
# Contributor: Philipp 'TamCore' B. <philipp at tamcore dot eu>

pkgname=stressapptest
_githash="14355fcf95e3089f20cfd36dbd457343f7b2b740"
pkgver=1.0.7
pkgrel=2
pkgdesc="Stressful Application Test (or stressapptest, its unix name)"
url="https://github.com/stressapptest/stressapptest"
license=('APACHE')
arch=('i686' 'x86_64')
depends=('gcc-libs' 'libaio')
makedepends=()
source=("https://github.com/${pkgname}/${pkgname}/archive/${_githash}.zip")
md5sums=('bc2ee67c8100e2ed8bb15b61a200422b')

build() {
  cd "${srcdir}"/"${pkgname}-${_githash}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/"${pkgname}-${_githash}"
  make DESTDIR="${pkgdir}" install
}

