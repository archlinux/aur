# Maintainer: Florian B. 

pkgname="powerline-shell"
pkgver='latest'
pkgrel=1
pkgdesc="A pretty prompt for your shell"
arch=("any")
url="https://github.com/b-ryan/powerline-shell"
license=("MIT")
provides=("${pkgname}")
depends=("python")
source=(
  "${pkgname}-${pkgver}::${url}/archive/master.tar.gz"
)
md5sums=('8e33b7a891816a0c58d84159f79b124b')

prepare() {
  cd "${srcdir}"
  mv "${pkgname}-master" "${pkgname}"
}

package() {
  cd "${srcdir}/${pkgname}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
