# Maintainer: linuxSEAT <--put_my_name_here--@gmail.com> 
#
pkgname=sortphotos
pkgver=r98.9037913
pkgrel=2
pkgdesc="A Python script that organizes photos and videos into folders"
arch=('any')
url="https://github.com/andrewning/sortphotos"
license=('MIT')
groups=()
makedepends=('python-setuptools')
source=(${pkgname}::'git+https://github.com/andrewning/sortphotos.git')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  python setup.py build
}

package() {
  cd "$pkgname"
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
