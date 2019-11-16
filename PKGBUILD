# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=slashtime
pkgver=0.5.13
pkgrel=3
pkgdesc="A small program which displays the time in various places"
arch=('any')
url="https://github.com/afcowie/slashtime.git"
license=('GPL')
depends=('java-gnome-bin' 'java-runtime=8' 'sh' 'hicolor-icon-theme')
makedepends=('java-environment=8' 'git')
source=("git+$url#commit=357e15714e9948dc3ae0aefb02325d83266c9740")
md5sums=('SKIP')

build() {
  cd $pkgname
  ./configure prefix=/usr jdk=/usr java-gnome=/usr 
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
