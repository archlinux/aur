# Maintainer: Feydreva <feydreva.aur at paradize dot io>
pkgname=winamax-bin
pkgver=2.30.0
pkgrel=1.3
pkgdesc="Winamax Poker"
arch=('x86_64')
url="https://www.winamax.fr"
license=('custom')
depends=(libxtst nss mesa alsa-lib)
optdepends=(libappindicator-gtk3)
source=("https://dl.winamax.fr/client/electron/linux/all/winamax-2.30.0.deb")
sha256sums=('642da8c598fb623b564d2b222325f8df4d944e36beb59f46ac9c2cfd0d52d2e7')

package() {
  cd "$srcdir"
  ar x "winamax-${pkgver}.deb"
  bsdtar -xf data.tar.* -C "$pkgdir"
  install -d "$pkgdir/usr/bin"
  ln -s /opt/Winamax/winamax "$pkgdir/usr/bin/winamax"

}



