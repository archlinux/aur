# Maintainer: Mélanie Chauvel (ariasuni) <perso@hack-libre.org>

_appname=hyperspace
pkgname="$_appname-bin"
pkgver=1.0.4
pkgrel=1
epoch=1
pkgdesc='The fluffiest client for the fediverse'
arch=(x86_64)
url='https://hyperspace.marquiskurt.net/'
license=(Apache)
depends=(gtk3 libnotify nss libxss libxtst xdg-utils libappindicator-gtk3 libsecret)
source=("https://github.com/hyperspacedev/hyperspace/releases/download/v${pkgver//_/-}/hyperspace_${pkgver//_/-}_amd64.deb")
sha256sums=('7335cd11a59c8c2f76d2f32bdbde73edd65db5eb5ed0a8730575b5b4711fce11')

build() {
  cd $srcdir
  ar x $(basename $source)
  tar xf data.tar.xz
}

package() {
  cp -R opt/ usr/ $pkgdir
  mkdir $pkgdir/usr/bin
  ln -s "/opt/Hyperspace Desktop/hyperspace" $pkgdir/usr/bin/hyperspace
}
