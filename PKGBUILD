# Maintainer: Evie Colburn

pkgname=dungeoneer
_pkgcommit=2fe9ff5c358f9ca2a287b96d8fe91a65b77f14a7/
pkgver=1.2.1
pkgrel=1
arch=('any')
pkgdesc="A tool for the lazy DM"
url="https://www.ogreforge.me/Dungeoneer/"
license=('AGPL3')
depends=('nodejs' 'npm')
makedepends=('yarn')
provides=('dungeoneer')
conflicts=('dungeoneer')
# Current most recent version is broken so using a random git commit
#source=("https://github.com/Durtur/Dungeoneer/archive/refs/tags/v$pkgver.tar.gz" "wrapper.sh")
source=("https://github.com/Durtur/Dungeoneer/archive/$_pkgcommit.zip" "wrapper.sh")
sha512sums=('620595c5f2e1bc72d679cc4eda9149ec036722973279342e956a2af5dd817b9fbd69077936dcfa54d5dfaae22c7a4eed2ad976566ef4c1533bb367b9e542767c'
            'a8b4a2f47e69859f70a109e88d4f47bb6e927962d14e0227411e990e5e422596ffabbf2eae2a8ba73dec926a84750400c69815cbe0c4c459dc62236b4725258d')
options=(!strip emptydirs)

build() {
  cd Dungeoneer-$_pkgcommit
  yarn install
}

package() {
  mkdir -p $pkgdir/opt/
  mv Dungeoneer-$_pkgcommit $pkgdir/opt/$pkgname
  install -Dm755 wrapper.sh $pkgdir/usr/bin/$pkgname
}
