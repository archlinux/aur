# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libnetfilter_cttimeout-git
pkgver=1.0.0.r5.gd0c4e39
pkgrel=1
pkgdesc="Library that provides access to the connection tracking timeout infrastructure"
arch=('i686' 'x86_64')
url="https://netfilter.org/projects/libnetfilter_cttimeout/index.html"
license=('GPL')
depends=('libmnl')
makedepends=('git')
provides=('libnetfilter_cttimeout')
conflicts=('libnetfilter_cttimeout')
source=("git://git.netfilter.org/libnetfilter_cttimeout")
sha256sums=('SKIP')


pkgver() {
  cd "libnetfilter_cttimeout"

  git describe --long --tags | sed 's/^libnetfilter_cttimeout-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libnetfilter_cttimeout"

  autoreconf -fi
  ./configure --prefix="/usr"
  make
}

package() {
  cd "libnetfilter_cttimeout"

  make DESTDIR="$pkgdir" install
}
