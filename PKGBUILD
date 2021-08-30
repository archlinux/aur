# Author: @jcsaaddupuy on GitHub
# Maintainer: Daniel Quinn <scrach+archlinuxaur at danielquinn dot org>

pkgname=python-kodi-json
_name=kodi-json
pkgver=1.0.0
pkgrel=1
pkgdesc="Python module for controlling kodi over HTTP Json API"
arch=('any')
url="https://github.com/jcsaaddupuy/python-kodijson"
license=('WTFPL')
makedepends=('python-setuptools')
depends=('python')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('de34ad3ba6984e81c416e427ca092b0fdfd4108df6a0f907df20303d1de4a8ae12f1b9bdd5cbe56e7d3654c9fb3b5f2e0666bdee49881cd8a024a6e066a59b39')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"
}
