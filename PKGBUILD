# Maintainer: Maria Nicolae <maria@marianicolae.com>

pkgname=epubsynth
pkgver=1.0.0
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
sha256sums=('e537bda159e62ab6baa488ed664daff98788d61b1a2ddff855c29a3928989e23')

build() {
    cd ${srcdir}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
