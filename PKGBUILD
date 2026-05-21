# Maintainer: AnmiTaliDev <anmitali198@gmail.com>
pkgname=alsa-ucm-xiaomi-pipa
pkgver=1
pkgrel=1
pkgdesc="ALSA UCM2 configuration for Xiaomi Pad 6 (pipa)"
arch=('aarch64' 'x86_64')
url="https://gitlab.postmarketos.org/postmarketOS/pmaports"
license=('MIT')
depends=('alsa-ucm-conf')

_baseurl="https://gitlab.postmarketos.org/postmarketOS/pmaports/-/raw/master/device/testing/device-xiaomi-pipa"

source=(
  "pipa.conf::${_baseurl}/pipa.conf"
  "HiFi.conf::${_baseurl}/HiFi.conf"
)
sha256sums=(
  '4b22e4c346f465f454340d78f319012bc7778c90f953f6c0148713cf4b5f2034'
  '5d54ed9a33f67fbfde7996f42ddc7e5c02837ed3e94b5678f057cc5358abeac8'
)

package() {
  install -Dm644 "$srcdir/pipa.conf" \
    "$pkgdir/usr/share/alsa/ucm2/Xiaomi/pipa/pipa.conf"
  install -Dm644 "$srcdir/HiFi.conf" \
    "$pkgdir/usr/share/alsa/ucm2/Xiaomi/pipa/HiFi.conf"

  install -dm755 "$pkgdir/usr/share/alsa/ucm2/conf.d/sm8250"
  ln -s "../../Xiaomi/pipa/pipa.conf" \
    "$pkgdir/usr/share/alsa/ucm2/conf.d/sm8250/Xiaomi Pad 6.conf"
}
