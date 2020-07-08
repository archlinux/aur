pkgname=python-django-colorfield
_name=${pkgname#python-}
pkgver=0.3.2
pkgrel=2
pkgdesc='Simple color field for models with a nice color-picker in the admin'
arch=('any')
url=https://github.com/fabiocaccamo/django-colorfield
license=('MIT')
depends=('python-django' 'python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('f5dde281f4db8871eb5845aee614b4f1a47e7fd5b20476238793f519cd7bdf41')

build(){
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 "${srcdir}/${_name}-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
