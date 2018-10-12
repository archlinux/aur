# Contributor: Scott Lawrence <bytbox@gmail.com>
# Maintainer: Scott Lawrence <bytbox@gmail.com>
pkgname=python-sickle
pkgver=0.6.4
pkgrel=1
pkgdesc="OAI-PMH for humans"
arch=('any')
url="https://pypi.org/project/Sickle"
license=('BSD')
depends=('python>=3.5' 'python-requests' 'python-lxml')
makedepends=()
source=("https://github.com/mloesch/sickle/archive/${pkgver}.tar.gz")
md5sums=('fe19e2cdc948607f6b5700d370ad7780')

build() {
  cd ${srcdir}/sickle-${pkgver}

  python setup.py build
}

package() {
  cd ${srcdir}/sickle-${pkgver}

  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
  python setup.py install --root=${pkgdir} --prefix=/usr
}
