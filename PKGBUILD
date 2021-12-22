pkgname=python-django-colorfield
_name=${pkgname#python-}
pkgver=0.6.0
pkgrel=1
pkgdesc='Simple color field for models with a nice color-picker in the admin'
arch=('any')
url=https://github.com/fabiocaccamo/django-colorfield
license=('MIT')
depends=('python-django' 'python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('aee0ad2d1f7cac2da205a5a0b9d2e5f2303f378d79ad846448d4c18fd262adc9')

build(){
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 "${srcdir}/${_name}-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
