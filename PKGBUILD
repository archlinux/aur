# Contributor: Aashik S  aashiks at gmail dot com
# Maintainer: Santhosh Thottingal and Rajeesh K Nambiar from http://smc.org.in
# Packager : Aashik S  aashiks at gmail dot com
pkgname=dict-freedict-eng-mal
pkgver=0.1
pkgrel=2
pkgdesc="Dict package for English-Malayalam Freedict dictionary for DICT protocol clients"
arch=('i686')
url="http://smc.org.in/"
license=('GPL')
groups=()
depends=(dictd)
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=dict-freedict-eng-mal.install
source=(http://download.savannah.nongnu.org/releases/smc/dictionary/$pkgname-$pkgver.tar.gz)
md5sums=('23ae2f1e7bdd9325c0effb1c6d42b22f') #generate with 'makepkg -g'

build() {
 cd $srcdir/$pkgname-$pkgver
 dictfmt -f -s Freedict-English-Malayalam -u smc.org.in dict-freedict-eng-mal < dict-freedict-eng-mal-src.txt && dictzip dict-freedict-eng-mal.dict || return 1
 mkdir -p $pkgdir/usr/share/dictd || return 1
 cp dict-freedict-eng-mal.index dict-freedict-eng-mal.dict.dz $pkgdir/usr/share/dictd/ || return 1
}
