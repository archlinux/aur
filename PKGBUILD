# Maintainer: linuxSEAT <--put_my_name_here--@gmail.com> 
#
pkgname=sortphotos
pkgver=65.05eca3c
pkgrel=1
pkgdesc="A Python script that organizes photos and videos into folders"
arch=('any')
url="https://github.com/andrewning/sortphotos"
license=('MIT')
groups=()
depends=('python' 'python-setuptools')
makedepends=('git')
source=(${pkgname}::'git+https://github.com/andrewning/sortphotos.git')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
