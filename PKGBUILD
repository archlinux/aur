# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=python3-saml
pkgver=1.15.0
pkgrel=2
pkgdesc="SAML Python Toolkit (compatible with Python3)"
arch=('any')
url='https://github.com/saml-toolkits/python3-saml'
license=('MIT')
makedepends=('python-build' 'python-poetry-core' 'python-installer')
depends=('python-lxml' 'python-isodate' 'python-xmlsec')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('73cf5d4ba26bf9552ab7213068997304d843a040162100ff93dee4ef5e0ffe9b')

build() {

    cd ${pkgname}-${pkgver}
    python -m build --no-isolation --skip-dependency-check --wheel

}

package() {

    cd ${pkgname}-${pkgver}
    python -m installer --destdir "${pkgdir}" dist/*.whl

    install -Dm644 ${srcdir}/${pkgname}-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

}
