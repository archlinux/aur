# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>

pkgname="mkdocs-include-markdown-plugin"
pkgver=7.1.5
pkgrel=1
pkgdesc="Mkdocs Markdown includer plugin."
url="https://github.com/mondeja/mkdocs-include-markdown-plugin"
license=('Apache-2.0')
arch=("any")
depends=("mkdocs" "python-wcmatch")
makedepends=('python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('351b7a3b0718e6f13410b4d7ea884e6a2c8c22ab31ea2f5a57ff9c78fa467ed4')

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

