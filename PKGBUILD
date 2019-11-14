# Maintainer: getzze <getzze at gmail dot com>

pkgname=('python-django-cleanup' 'python2-django-cleanup')
pkgver=4.0.0
pkgrel=1
pkgdesc="Automatically deletes old file for FileField and ImageField. It also deletes files on models instance deletion"
arch=(any)
url="https://github.com/un1t/django-cleanup"
license=('MIT')
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('776a76d21916a0b7bd4995297a8fbb4805e0d4f6f2c42662cf6cda2fa2fe22f1')
makedepends=('python-setuptools' 'python2-setuptools')

package_python-django-cleanup() {
  depends=('python-django')
  cd "$srcdir/django-cleanup-$pkgver"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-django-cleanup() {
  depends=('python2-django')
  cd "$srcdir/django-cleanup-$pkgver"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
