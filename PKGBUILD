# Maintainer: Erhan SAHIN <erhan@ssahin.net>
# Co-Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('python2-django-compressor' 'python-django-compressor')
_pkgbase='django-compressor'
pkgver=2.1
pkgrel=1
pkgdesc="Compresses linked and inline JavaScript or CSS into single cached files"
arch=(any)
url="https://github.com/django-compressor/django-compressor"
license=("Apache")
options=(!emptydirs)
makedepends=('python-setuptools' 'python2-setuptools')
source=("$_pkgbase-$pkgver.tar.gz::https://github.com/django-compressor/django-compressor/archive/${pkgver}.tar.gz")
sha256sums=('3fe2bfd34a9a9e4e778d0eb40c5a85f839310a50f0b8d1417237133d02aab776')

package_python-django-compressor() {
  depends=('python-rjsmin' 'python-rcssmin' 'python-django-appconf')
  optdepends=("python-lxml: Use lxml instead of Python's builtin HTML parser")
  cd "$srcdir/$_pkgbase-$pkgver"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-django-compressor() {
  depends=('python2-rjsmin' 'python2-rcssmin' 'python2-django-appconf')
  optdepends=("python2-lxml: Use lxml instead of Python's builtin HTML parser")
  cd "$srcdir/$_pkgbase-$pkgver"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
