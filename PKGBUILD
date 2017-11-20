# Contributor: Rorschach <r0schach@lavabit.com>
# Maintainer:  max.bra <max dot bra at alice dot it>

pkgname=ipscan
pkgver=3.5.2
_pkgintver=3.5.2
pkgrel=2
pkgdesc='Angry IP Scanner (or simply ipscan) is an open-source and cross-platform network scanner designed to be fast and simple to use. It scans IP addresses and ports as well as has many other features.'
arch=('i686' 'x86_64')
license=('GPL2')
url="http://www.angryziber.com"
depends=('java-runtime>=7')

[[ $CARCH == "i686" ]] && _intarch=linux
[[ $CARCH == "x86_64" ]] && _intarch=linux64

source=(ipscan.png ipscan ipscan.desktop)
source_i686+=(https://github.com/angryziber/ipscan/releases/download/$_pkgintver/ipscan-$_intarch-$_pkgintver.jar)
source_x86_64+=(https://github.com/angryziber/ipscan/releases/download/$_pkgintver/ipscan-$_intarch-$_pkgintver.jar)

md5sums=('59de9b8055fe037c77bf8339eee31b85'
         '5b1c941c32a444803677a2061aa55a70'
         '6a8f7a0fb70cf2c801ff5422870609f9')
md5sums_i686=('e935bcadc4e2536bdf1e3b2af05ede08')
md5sums_x86_64=('e935bcadc4e2536bdf1e3b2af05ede08')

noextract=($(for i in ${source[@]}; do basename $i; done) ipscan-$_intarch-$_pkgintver.jar)

package() {
  cd "$srcdir"
  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
  install -Dm644 $pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
  install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -Dm644 $pkgname-$_intarch-$_pkgintver.jar $pkgdir/usr/share/java/$pkgname/$pkgname-$_intarch-$_pkgintver.jar
}

