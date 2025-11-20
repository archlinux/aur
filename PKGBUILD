# Maintainer: Feydreva <feydreva.aur at paradize dot io>
pkgname=winamax-bin
pkgver=2.43.0
pkgrel=1.4
pkgdesc="Winamax Poker"
arch=('x86_64')
url="https://www.winamax.fr"
license=('custom')
depends=(libxtst nss mesa alsa-lib)
optdepends=(libappindicator-gtk3)
source=("https://dl.winamax.fr/client/electron/linux/all/winamax-2.43.0.deb")
sha256sums=('da257f5d5b2018fbcff8415afe6b1ba8df4b619f4895a2bff8fb5a27f0bcbdfe')
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



