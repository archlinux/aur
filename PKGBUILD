# Maintainer: Eric Anderson <ejona86 at gmail dot com>
# Contributor: delmonico <delmonico at gmx dot net>

pkgname=quarry
pkgver=0.3.0.1
pkgrel=1
pkgdesc="A multi-purpose GUI for Go, Amazons, and Othello"
arch=('i686' 'x86_64')
url='https://gitorious.org/quarry'
license=('GPL')
depends=('librsvg' 'desktop-file-utils' 'gtk2')
optdepends=('gnugo: play Go against the computer'
            'grhino: play Othello against the computer')
makedepends=('xmlto')
install='quarry.install'
source=("$pkgname-$pkgver.tar.gz::https://gitorious.org/$pkgname/quarry/archive/a6003cd78d9d3045aa65f11db3fdd05a0bff31fb.tar.gz")
md5sums=('11039e0c0fef8ccfdc6aeadfb6ae73bd')

build() {
  cd $pkgname-quarry/
  ./configure --prefix=/usr
  make
  make html
}

package() {
  cd $pkgname-quarry/
  make DESTDIR="$pkgdir" install
}
