# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=featherwallet-bin
_pkgname=featherwallet
pkgver=2.6.7
pkgrel=1
pkgdesc='A free, open-source Monero light wallet.'
url='https://featherwallet.org'
arch=('x86_64')
license=('custom')
provides=('featherwallet')
conflicts=('featherwallet' 'monero-feather' 'monero-feather-git' 'monero-feather-bin' 'monero-feather-appimage' 'featherwallet-appimage')
source=("$url/files/releases/linux/feather-$pkgver-linux.zip"
        "https://raw.githubusercontent.com/feather-wallet/feather/master/LICENSE")
sha512sums=('d55aa50acb198b105d320fe8d333b8b746f4c5112317fa159abb3defb538f6d578ed39473f2c038f1aa2283687d29eadb539c5b6e76729c7ac73a5ef48ade307'
            '0605a1ddf11e0effe03dfc8a8230f6b9297977cd8c6616c575dcf067cb3e71e0bb55e88a5a00760900027c433e76a07483afcd37409e214033aa07be3bb2b62a')

package() {
  install -Dm644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm755 "${srcdir}/feather-$pkgver" "$pkgdir/opt/$_pkgname/feather"

  # create symlinks
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/feather "${pkgdir}/usr/bin"
}
