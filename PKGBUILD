# Maintainer: Evie Colburn

pkgname=dungeoneer
pkgver=1.2.1
pkgrel=1
arch=('any')
pkgdesc="A tool for the lazy DM"
url="https://www.ogreforge.me/Dungeoneer/"
license=('AGPL3')
makedepends=('yarn' 'nodejs' 'npm')
provides=('dungeoneer')
conflicts=('dungeoneer')
source=("https://github.com/Durtur/Dungeoneer/archive/refs/tags/v$pkgver.tar.gz" "wrapper.sh")
sha512sums=('65693f4918b42ed665beba2c02927b28bf5316bf532004419992aaf670d26dc781f283a8774dad8620fb324f7cad52bfd867560e3778e0298090ca8547b8aa8a' 'SKIP')

build() {
  cd Dungeoneer-$pkgver
  yarn install
}

package() {
  mkdir -p $pkgdir/opt/
  mv Dungeoneer-$pkgver $pkgdir/opt/$pkgname
  install -Dm755 wrapper.sh $pkgdir/usr/bin/$pkgname
}
