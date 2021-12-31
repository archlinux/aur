# Maintainer: Ilaï Deutel <PlMWPh1WSmypRv0JQljz> (echo ... | tr 'A-Za-z' 'l-za-kL-ZA-K' | base64 -d)
# Contributor: Silvio Ankermann < silvio at booq dot org >

pkgname=photocollage
pkgver=1.4.5
pkgrel=1
pkgdesc='Graphical tool to make photo collage posters.'
url='https://github.com/adrienverge/PhotoCollage'
license=('GPL2')
arch=('any')
depends=('python-pillow' 'python-gobject' 'python-cairo' 'hicolor-icon-theme')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/adrienverge/PhotoCollage/archive/v${pkgver}.tar.gz")
sha256sums=('7dab2de4a098cb68369221bd634591dc768f10df2064a55bb8d6430cf5be5b36')


build() {
    cd "${srcdir}/PhotoCollage-${pkgver}"

    python setup.py build
}

check() {
    cd "${srcdir}/PhotoCollage-${pkgver}"

    python -m unittest tests/test_*.py
}


package() {
    cd "${srcdir}/PhotoCollage-${pkgver}"

    python setup.py install --optimize=1 "--root=${pkgdir}"
}
