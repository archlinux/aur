#Maintainer: Arafat Zahan <kuasha420@gmail.com>
#Contributor: Ekin Dursun <ekindursun@gmail.com>
#Contributor: danyf90 <daniele.formichelli@gmail.com>
#Contributor: syncrtl64 <syncrtl64@gmail.com>
#Contributor: Andrea Cattaneo <andrea.cattaneo.dev@gmail.com>
# https://dl.genymotion.com/releases/genymotion-3.1.0-beta3/genymotion-3.1.0-beta3-linux_x64.bin
pkgname=genymotion-beta
_pkgname=genymotion
pkgver=3.1.0beta3
_pkgver=3.1.0-beta3
pkgrel=1
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
sha512sums=('b0d3363bedab53d01d701811b511aa233661c78e454e9d6ee75cc6241b23db13672dbc9723dd19417d1650b87ce44d3869cf39fb3104162074190f10172dbad4'
            'a16a04b311f1b2194db4fe032c355b39e57d8473195788c1f18b1806ec051ecf8285e93e50c5dc98375678712e6410360aa959ca09c673043da788a8892c0a42'
            '7d1214bc270c9758e61b9f451699bea03485983ade2f3308e33ce6e4e1689c6d29ba16fdb7f297e03d866e78e0c5f6febfb63447848f07caf7b2f093aebb9c09'
            '6c08a6e9f7aaf40cab5a76e7d45fd31a73773ff2a2c6eda525dc814584016daa6636facb608f64e5e093779ecc66c561bc7ddc1778d9efa365a71b9e56df09e9')

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
