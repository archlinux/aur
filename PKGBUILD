# Maintainer: Feydreva <feydreva.aur at paradize dot io>
pkgname=winamax-bin
pkgver=2.38.1
pkgrel=1.4
pkgdesc="Winamax Poker"
arch=('x86_64')
url="https://www.winamax.fr"
license=('custom')
depends=(libxtst nss mesa alsa-lib)
optdepends=(libappindicator-gtk3)
source=("https://dl.winamax.fr/client/electron/linux/all/winamax-2.38.1.deb")
sha256sums=('e6736c82263ce66cbab37040e1a96f52ff07d4c0f007535b95bf466fb5d23077')
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



