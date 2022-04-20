# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
# Maintainer: Jean Lucas <jean@4ray.co>
# Maintainer: AI5C <ai5c@ai5c.com>
# Contributor: kaptoxic <kaptoxic at yahoo dot com>
# Contributor: Matthew Avant <matthew dot avant at gmail dot com>
# Contributor: Rose Ames <rose at happyspork dot com>

pkgname=zulip-desktop-bin
_pkgname=zulip-desktop
pkgver=5.9.1
pkgrel=1
pkgdesc='Real-time team chat based on the email threading model (bin)'
arch=(x86_64)
url=https://zulipchat.com
license=(Apache)
depends=(libxkbfile gtk3 libxss nss)
provides=(zulip-desktop)
conflicts=(zulip-desktop)
source=($pkgname-$pkgver.tar.xz::https://github.com/zulip/$_pkgname/releases/download/v$pkgver/Zulip-$pkgver-x64.tar.xz
        https://raw.githubusercontent.com/zulip/$_pkgname/v$pkgver/LICENSE
        $_pkgname.desktop
        https://raw.githubusercontent.com/zulip/$_pkgname/v$pkgver/build/zulip.png)
sha512sums=('be5ab7e28020643dee679217ef9a9bd352f78c8dece4acfe1dbb9c7fb3c112d0289272b9be9275092a5995d3ebc5ea392f0e39b56239b63925b5c420f8937e13'
            '389080b6132d3eaae780648d6998390d8cc71908561bce09578e27c542aa1a9f3122e01f640c5b01bee73004c23aa4e9f2066fe5ee0ca2072c2420578b28d71f'
            '4899b20aaff5f8906de1c9d0f9b54d440e9b22cd19a8b383def92b973a8c4d954f88cee623744ec42546dc2f82d4849bcc1c49917efbea9ab346d41ac0dba589'
            '7dc054b1dae348312d4d11ef737a1224f2d3b08048c6971fd8a70821a58aa62287eead44a667881eb1618f562104d3214e786a39c98a595e1db7e1b5f3410820')

package() {
  install -d "$pkgdir"/usr/{bin,lib/$_pkgname}
  tar xJf $pkgname-$pkgver.tar.xz -C "$pkgdir"/usr/lib/$_pkgname --strip-components=1
  ln -s /usr/lib/$_pkgname/zulip "$pkgdir"/usr/bin

  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$_pkgname

  install -Dm 644 $_pkgname.desktop -t "$pkgdir"/usr/share/applications
  install -Dm 644 zulip.png -t "$pkgdir"/usr/share/pixmaps
}

