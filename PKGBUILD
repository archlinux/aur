# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgbase=python-django-taggit
pkgname=(python-django-taggit python2-django-taggit)
_pkgname=django-taggit
pkgver=0.18.0
pkgrel=1
pkgdesc="Simple tagging application for Django"
arch=('any')
url="http://github.com/alex/django-taggit/"
license=('BSD')
makedepends=('python2-django' 'python-django')
source=(http://pypi.python.org/packages/source/d/$_pkgname/$_pkgname-$pkgver.tar.gz)
md5sums=('93c2cef739334a4ae47414926b0d0965')

check() {
  cd "${srcdir}"/$_pkgname-$pkgver

  python2 runtests.py
  python runtests.py
}

package_python2-django-taggit() {
  depends=('python2-django')

  cd "${srcdir}"/$_pkgname-$pkgver
  python2 setup.py install --root="${pkgdir}" --optimize=1

  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}

package_python-django-taggit() {
  depends=('python-django')

  cd "${srcdir}"/$_pkgname-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1

  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}
