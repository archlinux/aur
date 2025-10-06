# Maintainer: Maria Nicolae <maria@marianicolae.com>

pkgname=epubsynth
pkgver=1.0.1
pkgrel=1
pkgdesc='A command-line program for generating EPUB documents'

arch=(any)
url='https://marianicolae.com/software/epubsynth/'
license=('CC-BY-4.0 OR Apache-2.0')

depends=(python)
makedepends=(python-build
             python-installer
             python-wheel)

source=("https://marianicolae.com/files/software/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('8c46be156c596ca5624ff229f352cb063f717c6bda4604467ed95b9766e6a4ce')

build() {
    cd ${srcdir}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
