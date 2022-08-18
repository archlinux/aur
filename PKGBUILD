# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=featherwallet-bin
_pkgname=featherwallet
pkgver=2.1.0
pkgrel=1
pkgdesc='A free, open-source Monero light wallet.'
url='https://featherwallet.org'
arch=('x86_64')
license=('custom')
conflicts=('featherwallet')
source=("$url/files/releases/linux/feather-$pkgver-linux.zip"
        "https://raw.githubusercontent.com/feather-wallet/feather/master/LICENSE")
sha512sums=('74d01cd23760fe127014b6c3050ad654baab04732acc82409fd0e6246110420f9dbb34e6f889558e962ea5aa314e6de1454ef59cb3d3decaf2c2c7afa1763e20'
            '11f08714d5b32524758efcb24610ce7b64629edcd6469c720babdb1ed0d68cc112521921adc39cce1ee73d7da93434bb5f857fa60a43855ee2fa0bac169188b8')

package() {
  install -Dm644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm755 "${srcdir}/feather-$pkgver" "$pkgdir/opt/$_pkgname/feather"

  # create symlinks
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/feather "${pkgdir}/usr/bin"
}
