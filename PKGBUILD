# Maintainer: Simon Hanna <simhnna AT google email>

pkgname=('python-django-rest-framework' 'python2-django-rest-framework')
pkgver=3.9.3
pkgrel=1
pkgdesc="Awesome web-browsable Web APIs"
arch=(any)
url="https://github.com/tomchristie/django-rest-framework"
license=('MIT')
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tomchristie/django-rest-framework/archive/${pkgver}.tar.gz")
sha256sums=('c0484d6dd43b604875f8bd8f8c58df699c9a84f66ddddab0ce4db73d87b7e170')
makedepends=('python-setuptools' 'python2-setuptools')

package_python-django-rest-framework() {
  depends=('python-django')
  optdepends=(
    'python-pygments: Pygments support for API docs'
    'python-markdown: Markdown support for the browsable API'
    'python-django-crispy-forms: Improved HTML display for filtering'
    'python-coreapi: Schema generation support'
  )
  cd "$srcdir/django-rest-framework-$pkgver"
  install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-django-rest-framework() {
  depends=('python2-django')
  optdepends=(
    'python2-pygments: Pygments support for API docs'
    'python2-markdown: Markdown support for the browsable API'
    'python2-django-crispy-forms: Improved HTML display for filtering'
    'python2-coreapi: Schema generation support'
  )
  cd "$srcdir/django-rest-framework-$pkgver"
  install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
