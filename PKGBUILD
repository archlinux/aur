# Maintainer: Donald Webster <fryfrog@gmail.com>
# Contributor: Simon Hanna <simhnna AT google email>

pkgname=('python-django-rest-framework')
_name=djangorestframework
pkgver=3.10.1
pkgrel=1
pkgdesc="Awesome web-browsable Web APIs"
arch=(any)
url="https://github.com/tomchristie/django-rest-framework"
license=('MIT')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('ec7d2175f141695743a9fecc440f6590ed73f0d8992ca3fe0194cfa571c7d6e9979a96b9fd9f6f30d6654be34be7dd5ec21da39a55813b014bad6f82b4310d07')
makedepends=('python-setuptools')
depends=('python-django')
optdepends=('python-pygments: Pygments support for API docs'
            'python-markdown: Markdown support for the browsable API'
            'python-django-crispy-forms: Improved HTML display for filtering'
            'python-coreapi: Schema generation support')

package() {
  cd "${srcdir}/djangorestframework-${pkgver}"
  install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
