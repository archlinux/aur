# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
# Maintainer: Jean Lucas <jean@4ray.co>
# Maintainer: AI5C <ai5c@ai5c.com>
# Contributor: kaptoxic <kaptoxic at yahoo dot com>
# Contributor: Matthew Avant <matthew dot avant at gmail dot com>
# Contributor: Rose Ames <rose at happyspork dot com>

pkgname=zulip-desktop-bin
_pkgname=zulip-desktop
pkgver=5.1.0
pkgrel=1
pkgdesc='Real-time team chat based on the email threading model (bin)'
arch=(x86_64)
url=https://zulipchat.com
license=(Apache)
depends=(libxkbfile gtk3 libxss nss)
makedepends=(unzip)
provides=(zulip-desktop)
conflicts=(zulip-desktop)
source=($pkgname-$pkgver.zip::https://github.com/zulip/$_pkgname/releases/download/v$pkgver/Zulip-$pkgver-linux-x64.zip
        https://raw.githubusercontent.com/zulip/$_pkgname/v$pkgver/LICENSE
        $_pkgname.desktop
        https://raw.githubusercontent.com/zulip/$_pkgname/v$pkgver/build/zulip.png)
noextract=($pkgname-$pkgver.zip)
sha512sums=('50e887f56d7a4d76b85f12ff40e30c157c6cc451559324b461e9dc8767d490ff53081c87ce3851aa0e04d7dbb5afa7818f65272a2e34842738e66b32be402388'
            '389080b6132d3eaae780648d6998390d8cc71908561bce09578e27c542aa1a9f3122e01f640c5b01bee73004c23aa4e9f2066fe5ee0ca2072c2420578b28d71f'
            '7696a6874d17957f99452452723ae1a6b32b6814b018361a71ed1fe0191e1c6da6f3ad693e2e279615e74f687c380ff2f6dab8b69fcd82476e8f33b56a6b4cb5'
            '5ef9d1acdc72e7bb5b00574866f78fc2f0ea38a0179055b981c20e623b1a0e6a110cad05b487d74662bd290f76b97fe7599ef8559facb766af55da1346493ca6')

package() {
  install -d "$pkgdir"/usr/{bin,lib/$_pkgname}
  unzip $pkgname-$pkgver.zip -d "$pkgdir"/usr/lib/$_pkgname
  ln -s /usr/lib/$_pkgname/zulip "$pkgdir"/usr/bin

  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$_pkgname

  install -Dm 644 $_pkgname.desktop -t "$pkgdir"/usr/share/applications
  install -Dm 644 zulip.png -t "$pkgdir"/usr/share/pixmaps
}

