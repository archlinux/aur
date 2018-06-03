# Maintainer: getzze <getzze at gmail dot com>

pkgname=('python-django-cleanup' 'python2-django-cleanup')
pkgver=2.1.0
pkgrel=1
pkgdesc="Automatically deletes old file for FileField and ImageField. It also deletes files on models instance deletion"
arch=(any)
url="https://github.com/un1t/django-cleanup"
license=('MIT')
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('bee4d05411d91947493a6abcfe46a0429856471b73a1c3051683e2d422bd0176')
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
