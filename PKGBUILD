# Maintainer: liberodark

pkgname=guitar
pkgver=0.9.4
pkgrel=1
pkgdesc="Git GUI Client"
arch=('x86_64')
url="https://github.com/soramimi/Guitar/"
license=('GPL')
depends=('xdg-utils' 'git' 'qt5ct' 'libpng' 'libxcb' 'icu')
source_x86_64=("http://files.soramimi.jp/guitar/${pkgver}/Guitar-${pkgver}-ubuntu16-x64.tar.gz")
source=($pkgname.desktop
        $pkgname.svg)
sha512sums=('24cfa7553e3eb911a921a688d12f035989503998e19cd63e237491a4a462ead3add785ab0b0a50a5bdddb308560b89902f6a19b85aed26aff46be99f6754cdbe'
         'a731360c2dfbcc74017d0952bad6467d22a23e11d886ad12f18efe96e63e89b0aea76ecc10e5c385fc337191ebe468cf3394c5981f368065d6dab5ddb9723571')
sha512sums_x86_64=('ec641d7a577a662e5523e5acc6242ce7002135f9dc7331d96c005c3c9677ad9d27c958f34ad1f1efb98de3e40be73387f14ef439e433c7001e259459dc7af4fd')
        
package() {
  cd $srcdir
  tar xvf Guitar-${pkgver}-ubuntu16-x64.tar.gz
  mkdir -p "$pkgdir/opt/Guitar/"
  rm -r "Guitar/LinuxDesktop"
  cp "Guitar/Guitar" "$pkgdir/opt/Guitar/"
  install -vDm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -vDm644 $srcdir/$pkgname.svg $pkgdir/opt/Guitar/$pkgname.svg
}