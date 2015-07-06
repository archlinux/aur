# Maintainer: Boohbah <boohbah at gmail.com> 

pkgname=raur-git
_gitname=raur
pkgver=27.21c9303
pkgrel=1
pkgdesc="A simple AUR helper in Ruby"
arch=('any')
url="https://github.com/Boohbah/raur"
license=('GPL')
depends=('pacman' 'ruby')
optdepends=('sudo: package installation support')
makedepends=('git')
conflicts=('raur')
provides=('raur')
source=('git://github.com/Boohbah/raur')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd $_gitname
  install -Dm755 raur.rb "$pkgdir/usr/bin/raur"
}
