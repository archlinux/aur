# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>

pkgname='mkdocs-include-markdown-plugin'
pkgver=7.3.1
pkgrel=1
pkgdesc='Mkdocs Markdown includer plugin.'
url='https://github.com/mondeja/mkdocs-include-markdown-plugin'
license=('Apache-2.0')
arch=('any')
depends=('mkdocs' 'python-wcmatch')
makedepends=('python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f921e406be28db8ad6d1a389dabb17a5c1889a0909f639a0cf6fffe844d256fe')

build(){
    cd "${pkgname}-${pkgver}"

    python -m build --wheel --no-isolation
}

package(){
    cd "${pkgname}-${pkgver}"

    install -D -m 644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
