# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=featherwallet-bin
_pkgname=featherwallet
pkgver=2.6.4
pkgrel=1
pkgdesc='A free, open-source Monero light wallet.'
url='https://featherwallet.org'
arch=('x86_64')
license=('custom')
provides=('featherwallet')
conflicts=('featherwallet' 'monero-feather' 'monero-feather-git' 'monero-feather-bin' 'monero-feather-appimage' 'featherwallet-appimage')
source=("$url/files/releases/linux/feather-$pkgver-linux.zip"
        "https://raw.githubusercontent.com/feather-wallet/feather/master/LICENSE")
sha512sums=('006cb6f6db6bcd70c8827905c144ffde93d367e9de3aa2a9b82aa6ad6fccb2626760453dd6069497a7e98b5b214e10ddccd6661f1b836a8270923c3c44b1c3e8'
            '0605a1ddf11e0effe03dfc8a8230f6b9297977cd8c6616c575dcf067cb3e71e0bb55e88a5a00760900027c433e76a07483afcd37409e214033aa07be3bb2b62a')

package() {
  install -Dm644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm755 "${srcdir}/feather-$pkgver" "$pkgdir/opt/$_pkgname/feather"

  # create symlinks
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/feather "${pkgdir}/usr/bin"
}
