# Maintainer: Lucas Silva <lcdss@live.com>

pkgname=lbry-desktop-bin
pkgver=0.51.1
pkgrel=1
pkgdesc='A browser for the LBRY network, a digital marketplace controlled by its users'
arch=('x86_64')
url='https://lbry.com/'
license=('MIT')
provides=('lbry' 'lbrynet')
depends=('libnotify' 'libappindicator-gtk2' 'libxtst' 'nss' 'libsecret')
source=("https://github.com/lbryio/lbry-desktop/releases/download/v$pkgver/LBRY_$pkgver.deb")
sha512sums=('6e34cb092378c8b70d3b4856191e2b3963699c8ccb92d32112745af00a8683bcc59c87bb37147cf02544e1eb2a7f81d456729d2c16e0c5b6a3083ddbeba378b9')

package() {
  install -dm 755 "$pkgdir/usr/bin/"
  tar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
  ln -s "/opt/LBRY/lbry" "$pkgdir/usr/bin/lbry"
  ln -s "/opt/LBRY/resources/static/daemon/lbrynet" "$pkgdir/usr/bin/"
}
