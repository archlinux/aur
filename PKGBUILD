# Maintainer: Donald Webster <fryfrog@gmail.com>
# Contributor: Simon Hanna <simhnna AT google email>

pkgname=('python2-django-rest-framework')
_name=djangorestframework
pkgver=3.10.3
pkgrel=1
pkgdesc="Awesome web-browsable Web APIs"
arch=(any)
url="https://github.com/tomchristie/django-rest-framework"
license=('MIT')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('bd1a8c9dd639d34f88911cee4d02252e608c26cfec5f1c96ae3250f359c6c962612bf56718cd3d74d680b3733bcc86664b94c9241cbf184984a30827c34ba4d8')
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
