#Maintainer: David McInnis <davidm@eagles.ewu.edu>

pkgbase=('python-django-jrac')
pkgname=('python-django-jrac')
_module='django-jrac'
pkgver='1.0.2.dev10'
pkgrel=1
pkgdesc="jQuery Resize And Crop (jrac): visually resize an image and place a crop"
url="https://github.com/daavve/django-jrac"
depends=('python' 'python-django-jquery-ui')
makedepends=('python-setuptools')
license=('GPL')
arch=('any')
source=("https://pypi.python.org/packages/source/d/django-jrac/django-jrac-${pkgver}.tar.gz"
"COPYRIGHT.txt::https://github.com/daavve/django-jrac/blob/master/COPYRIGHT.txt?raw=true")
sha256sums=('e391d45a26399ba3a5bc4eecd7a5f702e5e7c76f7286d514004f85a8a5974459'
            '7c45774fc1f9a2a25f5d7a8734f5b5bb489a5ba85e3a7abe158955957ed74237')

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 ../COPYRIGHT.txt "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT.txt"
}
