# Maintainer: Miguel de Val-Borro <miguel at archlinux dot net>

pkgname=('python-django-markdown-deux' 'python2-django-markdown-deux')
pkgver=1.0.5
pkgrel=3
pkgdesc="A django app that provides Markdown-related template tags"
arch=('any')
url="http://github.com/trentm/django-markdown-deux"
license=('BSD')
depends=('python-markdown2' 'python2-markdown2')
makedepends=('python' 'python-setuptools' 'python2' 'python2-setuptools')
source=("https://pypi.python.org/packages/source/d/django-markdown-deux/django-markdown-deux-${pkgver}.zip")
md5sums=('6e3016740f3164020ff93882bc7a6cf0')

build() {
  cp -r ${srcdir}/django-markdown-deux-${pkgver} ${srcdir}/django-markdown-deux-${pkgver}-py2

  cd ${srcdir}/django-markdown-deux-${pkgver}
  python setup.py build

  cd ${srcdir}/django-markdown-deux-${pkgver}-py2
  python2 setup.py build
}

package_python-django-markdown-deux() {
  depends=('python-django')
  cd ${srcdir}/django-markdown-deux-${pkgver}
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --prefix=/usr --root=${pkgdir}
}

package_python2-django-markdown-deux() {
  depends=('python2-django')
  cd ${srcdir}/django-markdown-deux-${pkgver}-py2
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python2 setup.py install --prefix=/usr --root=${pkgdir}
}
