# Maintainer: Tomasz Zok <tomasz dot zok at gmail dot com>
pkgname=python-pandoc-run-filter
pkgver=0.2.0
pkgrel=1
pkgdesc="A simple pandoc filter that runs an embedded command or script in a markdown document capturing its output as an image or text."
arch=(any)
url="https://github.com/johnlwhiteman/pandoc-run-filter"
license=(custom)
depends=('python>=3.8' 'pandoc>=2.9')
makedepends=(python-setuptools)
source=("https://github.com/johnlwhiteman/pandoc-run-filter/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('82407ed85fd6b36619df01819cba47133783d8b7480e2b19af6d32f659b9b8c1')

build() {
    cd "pandoc-run-filter-${pkgver}"
    python setup.py build
}

package() {
    cd "pandoc-run-filter-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/" LICENSE
}
