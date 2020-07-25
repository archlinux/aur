# Maintainer: Hao Long <aur@esd.cc>

pkgname=python-cipheydists
_pkgname=cipheydists
pkgver=0.3.10
pkgrel=1
pkgdesc="A collection of sample distributions for use in Ciphey's frequency analysis"
arch=("any")
url="https://github.com/Ciphey/CipheyDists"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "${url}/raw/master/LICENSE")
sha256sums=('a9c6825b23daedb1af8da4d0730f15af8c065a8e80f4ec31ed1e1b2af0356918'
            '5cecf7f3f421c679134a8cc9af8fbebc7883195a8f26aab8e77f2e7460284dfe')

build() {
  cd ${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 ${srcdir}/LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
