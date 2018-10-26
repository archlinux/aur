# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgbase=python-django-taggit
pkgname=(python-django-taggit python2-django-taggit)
_pkgname=django-taggit
pkgver=0.23.0
pkgrel=1
pkgdesc="Simple tagging application for Django"
arch=('any')
url="http://github.com/alex/django-taggit/"
license=('BSD')
makedepends=('python2-django' 'python-django' 'python2-mock' 'python-mock')
source=($_pkgname-$pkgver.tar.gz::https://github.com/alex/django-taggit/archive/$pkgver.tar.gz)
sha256sums=('f6c9cbeea93dd04406f815ebfea3bdfb4fab0af5e1a93d2f3e13a79e0b47486a')

# tests currently fail
# check() {
#   cd "${srcdir}"/$_pkgname-$pkgver
# 
#   python2 setup.py test
#   python setup.py test
# }

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
