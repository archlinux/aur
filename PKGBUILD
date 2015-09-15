# Maintainer: Erhan SAHIN <erhan@ssahin.net>
# Co-Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('python2-django-compressor' 'python-django-compressor')
_pkgbase='django-compressor'
pkgver=1.5
pkgrel=2
pkgdesc="Compresses linked and inline JavaScript or CSS into single cached files"
arch=(any)
url="https://github.com/django-compressor/django-compressor"
license=("Apache")
options=(!emptydirs)
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/django-compressor/django-compressor/archive/${pkgver}.tar.gz")
sha256sums=('2f094de9c061f38b741db9fc88d359abc424f077b324fe33f5e93ecf91f8f2eb')

package_python-django-compressor() {
  depends=('python-lxml' 'python-django-appconf')
  cd "$srcdir/$_pkgbase-$pkgver"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-django-compressor() {
depends=('python2-lxml' 'python2-django-appconf')
  cd "$srcdir/$_pkgbase-$pkgver"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
