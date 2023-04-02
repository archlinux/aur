#Maintainer: Arafat Zahan <kuasha420@gmail.com>
#Contributor: Ekin Dursun <ekindursun@gmail.com>
#Contributor: danyf90 <daniele.formichelli@gmail.com>
#Contributor: syncrtl64 <syncrtl64@gmail.com>
#Contributor: Andrea Cattaneo <andrea.cattaneo.dev@gmail.com>
# https://dl.genymotion.com/releases/genymotion-3.1.0-beta3/genymotion-3.1.0-beta3-linux_x64.bin
pkgname=genymotion-beta
_pkgname=genymotion
pkgver=3.3.0beta1
_pkgver=3.3.0-beta1
pkgrel=2
pkgdesc="Complete set of tools that provides a virtual environment for Android. Beta Release"
arch=('x86_64')
provides=("genymotion")
conflicts=("genymotion")
url="http://www.genymotion.com/"
depends=('libpng' 'net-tools' 'protobuf' 'qca-qt5' 'qt5-script' 'qt5-webkit' 'virtualbox')
install=$pkgname.install
license=('custom')
_ARCH="x64"
source=("genymotion-beta.desktop"
        "genymotion-player-beta.desktop"
        "genymotion-beta.install"
        "https://dl.genymotion.com/releases/$_pkgname-$_pkgver/$_pkgname-$_pkgver-linux_$_ARCH.bin")
sha512sums=('1f6b4590bb8eb12a191d79984fe66b84d19afb3f10708f3c49f99f2f1c6572ae9e7b4c18b9bc771d75ebb44e09e275cf7e59207ead627f08397947d039dc099a'
            'a16a04b311f1b2194db4fe032c355b39e57d8473195788c1f18b1806ec051ecf8285e93e50c5dc98375678712e6410360aa959ca09c673043da788a8892c0a42'
            '7d1214bc270c9758e61b9f451699bea03485983ade2f3308e33ce6e4e1689c6d29ba16fdb7f297e03d866e78e0c5f6febfb63447848f07caf7b2f093aebb9c09'
            'e2db4a1bf512d9a37dcfc741928357016d5c43cf1b15aa3b19b973e29986bfca1e0e9cfc804b374ef67078a37b55a9854f10d0919b75a98125673389d1bf2d45')

package(){
  cd $srcdir

  install -d $pkgdir/opt
  yes | bash ./$_pkgname-$_pkgver-linux_$_ARCH.bin -d $pkgdir/opt

  install -d $pkgdir/usr/bin
  ln -s /opt/genymotion/genymotion $pkgdir/usr/bin/genymotion
  ln -s /opt/genymotion/genymotion-shell $pkgdir/usr/bin/genymotion-shell
  ln -s /opt/genymotion/player $pkgdir/usr/bin/genymotion-player
  ln -s /opt/genymotion/gmtool $pkgdir/usr/bin/gmtool
  install -Dm644 $srcdir/genymotion-beta.desktop $pkgdir/usr/share/applications/genymotion-beta.desktop
  install -Dm644 $srcdir/genymotion-player-beta.desktop $pkgdir/usr/share/applications/genymotion-player-beta.desktop
  chown -R root:root $pkgdir/opt/genymotion
}
