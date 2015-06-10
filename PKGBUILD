# Maintainer: Francois Boulogne <fboulogne@april.org>
# Contributor: Francois Boulogne <fboulogne@april.org>

pkgname=brebis
pkgver=0.9
pkgrel=1
pkgdesc='A fully automated backup checker'
arch=('any')
url='http://brebisproject.org'
license=('GPL3')
install='brebis.install'
depends=('python')
makedepends=('python-setuptools')
optdepends=()
source=("http://brebisproject.org/attachments/download/18/${pkgname}-${pkgver}.tar.gz")
md5sums=('d24575ec497bfab7e0a923cbd6df997d')


build(){
  cd "brebis-${pkgver}"

  python setup.py build
}

package() {
  cd "brebis-${pkgver}"

  python setup.py install --prefix=/usr --root="${pkgdir}"
  install -d "${pkgdir}"/etc/brebis
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
# vim:ts=2:sw=2:et:
