# Maintainer: Joshua Rubin <me at jawa dot dev>

pkgname=pythonprop-git
_pkgname=pythonprop
pkgver=v0.22.r108.gf478098
pkgrel=1
pkgdesc='A collection of scripts using the VOACAP HF propagation prediction engine'
arch=('any')
url='https://github.com/jawatson/pythonprop'
license=('GPL2')
depends=('voacapl' 'python-matplotlib' 'python-cartopy' 'python-scipy' 'python-basemap')
makedepends=('git' 'dblatex' 'yelp-tools')
provides=('pythonprop')
conflicts=('pythonprop')
source=("${_pkgname}::git+https://github.com/jawatson/${_pkgname}")
md5sums=('SKIP')
sha1sums=('SKIP')
sha256sums=('SKIP')
sha384sums=('SKIP')
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  ./autogen.sh
}

build() {
  cd "$_pkgname"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir/" install
}
