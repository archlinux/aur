# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=featherwallet-bin
_pkgname=featherwallet
pkgver=2.6.2
pkgrel=1
pkgdesc='A free, open-source Monero light wallet.'
url='https://featherwallet.org'
arch=('x86_64')
license=('custom')
provides=('featherwallet')
conflicts=('featherwallet' 'monero-feather' 'monero-feather-git' 'monero-feather-bin' 'monero-feather-appimage' 'featherwallet-appimage')
source=("$url/files/releases/linux/feather-$pkgver-linux.zip"
        "https://raw.githubusercontent.com/feather-wallet/feather/master/LICENSE")
sha512sums=('bedefbcd7123add56a3967e65e09cbd1ccc8b72b2cead2e146e781824f01d5e6b0ae383933078bf74ecedfc34a578f78e96aeb6b48715a651baf44c8e74fac26'
            '0605a1ddf11e0effe03dfc8a8230f6b9297977cd8c6616c575dcf067cb3e71e0bb55e88a5a00760900027c433e76a07483afcd37409e214033aa07be3bb2b62a')

package() {
  install -Dm644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm755 "${srcdir}/feather-$pkgver" "$pkgdir/opt/$_pkgname/feather"

  # create symlinks
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/feather "${pkgdir}/usr/bin"
}
