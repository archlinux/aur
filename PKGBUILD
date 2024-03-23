# Maintainer: kjm @ AUR
pkgname=python-django-colorfield
_name=${pkgname#python-} # Used because AUR package name is different
pkgver=0.11.0
pkgrel=1
pkgdesc='Simple color field for models with a nice color-picker in the admin'
arch=('any')
url=https://github.com/fabiocaccamo/django-colorfield
license=('MIT')
depends=('python-django' 'python')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/fabiocaccamo/django-colorfield/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('15b95b48c1bfd4ec3324e7851cae4cbcc9049a610e625e91e665baf5a9184fbb')

build(){
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 "${srcdir}/${_name}-${pkgver}/LICENSE.txt" \
  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
