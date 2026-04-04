# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>

pkgname='mkdocs-include-markdown-plugin'
pkgver=7.2.2
pkgrel=1
pkgdesc='Mkdocs Markdown includer plugin.'
url='https://github.com/mondeja/mkdocs-include-markdown-plugin'
license=('Apache-2.0')
arch=('any')
depends=('mkdocs' 'python-wcmatch')
makedepends=('python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('26b2d454415b0c8e76733005a89889d971d61c59541228d1a47e4423a86f76d8')

build(){
    cd "${pkgname}-${pkgver}"

    python -m build --wheel --no-isolation
}

package(){
    cd "${pkgname}-${pkgver}"

    install -D -m 644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
