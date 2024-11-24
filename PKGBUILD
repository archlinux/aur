# Maintainer: Evie Colburn

pkgname=dungeoneer
pkgver=1.2.6
pkgrel=1
arch=('any')
pkgdesc="A tool for the lazy DM"
url="https://www.ogreforge.me/Dungeoneer/"
license=('AGPL3')
depends=('nodejs' 'npm')
makedepends=('yarn')
provides=('dungeoneer')
conflicts=('dungeoneer')
source=("https://github.com/Durtur/Dungeoneer/archive/refs/tags/v$pkgver.zip" "wrapper.sh")
sha512sums=('789a1713a0eb6fa436f115157a3ec6ac7a728fc738f0d3ece60d8991a465cb57848b74642b6398fd1801cffc95ea24870bb485cb1b892be4f508ed5de8878f0e'
            'a8b4a2f47e69859f70a109e88d4f47bb6e927962d14e0227411e990e5e422596ffabbf2eae2a8ba73dec926a84750400c69815cbe0c4c459dc62236b4725258d')
options=(!strip emptydirs)

build() {
  cd Dungeoneer-$pkgver
  yarn install
}

package() {
  mkdir -p $pkgdir/opt/
  mv Dungeoneer-$pkgver $pkgdir/opt/$pkgname
  install -Dm755 wrapper.sh $pkgdir/usr/bin/$pkgname
}
