# Maintainer: Martin Harrigan <martinharrigan at gmail.com>
pkgname='python-llm'
pkgdesc='A CLI utility and Python library for interacting with Large Language Models, both via remote APIs and models that can be installed and run on your own machine.'
url='https://github.com/simonw/llm'
pkgver='0.15'
pkgrel='1'
arch=('any')
license=('Apache-2.0')
depends=('python' 'python-setuptools')
source=("${pkgver}.tar.gz::https://github.com/simonw/llm/archive/${pkgver}.tar.gz")
sha256sums=('8efcf3704fd587ed865c2b8518d2d9fb9cf997487dbc75411ed75723a573b803')

build() {
    cd "${srcdir}/llm-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/llm-${pkgver}"
    python setup.py install --skip-build -O1 --root="${pkgdir}"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
