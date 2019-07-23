# Maintainer: Donald Webster <fryfrog@gmail.com>
# Contributor: Simon Hanna <simhnna AT google email>

pkgname=('python2-django-rest-framework')
_name=djangorestframework
pkgver=3.9.4
pkgrel=1
pkgdesc="Awesome web-browsable Web APIs"
arch=(any)
url="https://github.com/tomchristie/django-rest-framework"
license=('MIT')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('bfa269b1ca95c1d35d97f3fcdcf821778f2c2ba14ce79288b776ecff369922603ba9a2292a59ca8ad263eb3eef675420a2bb2e609e11e53e503a78bd365b2913')
makedepends=('python2-setuptools')
depends=('python2-django')
optdepends=('python2-pygments: Pygments support for API docs'
            'python2-markdown: Markdown support for the browsable API'
            'python2-django-crispy-forms: Improved HTML display for filtering'
            'python2-coreapi: Schema generation support')

package() {
  cd "${srcdir}/djangorestframework-${pkgver}"
  install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
