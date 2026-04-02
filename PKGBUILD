# Maintainer: Feydreva <feydreva.aur at paradize dot io>
pkgname=winamax-bin
pkgver=2.53.0
pkgrel=1.4
pkgdesc="Winamax Poker"
arch=('x86_64')
url="https://www.winamax.fr"
license=('custom')
depends=(libxtst nss mesa alsa-lib)
optdepends=(libappindicator-gtk3)
source=("https://dl.winamax.fr/client/electron/linux/all/winamax-2.53.0.deb")
sha256sums=('1ee8aa48042e66602a746628c2a6dcb09ffef03ef950c8d68c4c01e1545a2701')
options=('!debug')
package() {
  export LANG=C.UTF-8
  export LC_ALL=C.UTF-8
  cd "$srcdir"
  ar x "winamax-${pkgver}.deb"
  bsdtar -xf data.tar.* -C "$pkgdir"
  install -d "$pkgdir/usr/bin"
  ln -s /opt/Winamax/winamax "$pkgdir/usr/bin/winamax"
  rm -rf "$pkgdir"/opt/Winamax/{docs,*.dbg}
}



