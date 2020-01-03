# Maintainer: Silvio Ankermann < silvio at booq dot org >

pkgname=photocollage
pkgver=1.4.4
pkgrel=4
pkgdesc='Graphical tool to make photo collage posters.'
url='https://github.com/adrienverge/PhotoCollage'
license=('GPLv2')
arch=('any')
depends=('python-pillow' 'python-gobject' 'python-cairo')
source=("https://github.com/adrienverge/PhotoCollage/archive/v${pkgver}.zip")
sha256sums=('880400f36df03a1c784ded99652dc9515b95cb2063ca05d7192e03e3cbaf0172')


build() {
    cd "${srcdir}/PhotoCollage-${pkgver}"

    python setup.py build
}


package() {
    cd "${srcdir}/PhotoCollage-${pkgver}"

    python setup.py install --optimize=1 "--root=${pkgdir}"
}
