pkgname=python-django-colorfield
_name=${pkgname#python-}
pkgver=0.4.1
pkgrel=1
pkgdesc='Simple color field for models with a nice color-picker in the admin'
arch=('any')
url=https://github.com/fabiocaccamo/django-colorfield
license=('MIT')
depends=('python-django' 'python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('63a542c417b72d0dac898a0f61a2a00aed3c9aabc2f5057c926efccf421f7887')

build(){
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 "${srcdir}/${_name}-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
