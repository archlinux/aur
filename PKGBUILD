pkgname=python-django-colorfield
_name=${pkgname#python-}
pkgver=0.3.0
pkgrel=1
pkgdesc='Simple color field for models with a nice color-picker in the admin'
arch=('any')
url=https://github.com/fabiocaccamo/django-colorfield
license=('MIT')
depends=('python-django' 'python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('808fd1783be0331dc15f0d4e98d18e3b31257b4837ac89594b94f87170d6c6ce')

build(){
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 "${srcdir}/${_name}-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
