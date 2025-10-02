# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>

pkgname="mkdocs-include-markdown-plugin"
pkgver=7.2.0
pkgrel=1
pkgdesc="Mkdocs Markdown includer plugin."
url="https://github.com/mondeja/mkdocs-include-markdown-plugin"
license=('Apache-2.0')
arch=("any")
depends=("mkdocs" "python-wcmatch")
makedepends=('python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4ecbd20083563c219cc53a21c5fdbde0497c6a30acef8450cb2b1374e3f8a6e1')

build(){
    cd ${srcdir}/${pkgname}-${pkgver}

    python -m build --wheel --no-isolation
}

package(){
    cd ${srcdir}/${pkgname}-${pkgver}

    install -D -m 644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m 644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

