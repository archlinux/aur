# Maintainer: Feydreva <feydreva.aur at paradize dot io>
pkgname=winamax-bin
pkgver=2.33.3
pkgrel=1.3
pkgdesc="Winamax Poker"
arch=('x86_64')
url="https://www.winamax.fr"
license=('custom')
depends=(libxtst nss mesa alsa-lib)
optdepends=(libappindicator-gtk3)
source=("https://dl.winamax.fr/client/electron/linux/all/winamax-2.33.3.deb")
sha256sums=('441f782133f37ef796a9897123d49e1241d424ae672f03eff8a7cc9fee426b66')

package() {
  cd "$srcdir"
  ar x "winamax-${pkgver}.deb"
  bsdtar -xf data.tar.* -C "$pkgdir"
  install -d "$pkgdir/usr/bin"
  ln -s /opt/Winamax/winamax "$pkgdir/usr/bin/winamax"

}



