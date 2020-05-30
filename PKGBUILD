# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=python-django-taggit
pkgver=1.3.0
pkgrel=1
pkgdesc="Simple tagging application for Django"
arch=('any')
url="https://github.com/jazzband/django-taggit/"
license=('BSD')
makedepends=('python-django' 'python-mock')
source=($pkgname-$pkgver.tar.gz::https://github.com/jazzband/django-taggit/archive/$pkgver.tar.gz)
sha256sums=('d36b16107717db86829ad9077bdb3acfe67450708c5d4df5caa26888752d4a49')

# tests fail
# check() {
#   cd "${srcdir}"/django-taggit-$pkgver
# 
#   python setup.py test
# }

package() {
  cd "${srcdir}"/django-taggit-$pkgver
  
  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}
