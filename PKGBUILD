# Maintainer: kfgz <kfgz at interia dot pl>
# Contributor: Philipp 'TamCore' B. <philipp at tamcore dot eu>

pkgname=stressapptest
pkgver=1.0.8
_pkgver=v${pkgver}
pkgrel=1
pkgdesc="Stressful Application Test (or stressapptest, its unix name)"
url="https://github.com/stressapptest/stressapptest"
license=('APACHE')
arch=('i686' 'x86_64')
depends=('gcc-libs' 'libaio')
makedepends=()
source=("https://github.com/${pkgname}/${pkgname}/archive/${_pkgver}.tar.gz")
md5sums=('f1c266b6aa657273a36d9e68c5c5d052')

build() {
  cd "${srcdir}"/"${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/"${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
