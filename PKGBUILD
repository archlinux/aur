# Maintainer: Alex Sarum <rum.274.4 at gmail dot com>
# Contributor: Bailey Fox <bfox200012@gmail.com>

pkgname=('python-crccheck')
_module=${pkgname#python-}
pkgver='0.6'
pkgrel=2
pkgdesc="Calculation library for CRCs and checksums"
url="https://bitbucket.org/martin_scharrer/crccheck"
depends=('python')
makedepends=('python-setuptools')
license=('GPL3')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/${_module}/${_module}-${pkgver}.zip")
sha256sums=('5686a4e5c3a2949597316c067c49c21e06051d13de9521434480cfa24dad7e32')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    rm -r ${pkgdir}/usr/lib/python3.8/site-packages/tests/
}
