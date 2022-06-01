# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=featherwallet-bin
_pkgname=featherwallet
pkgver=1.0.1
pkgrel=1
pkgdesc='A free, open-source Monero light wallet.'
url='https://featherwallet.org'
arch=('x86_64')
license=('custom')
conflicts=('featherwallet')
source=("$url/files/releases/linux/feather-$pkgver-linux.zip"
        "https://raw.githubusercontent.com/feather-wallet/feather/master/LICENSE")
sha512sums=('ef75824c5f00500899dbb8940431c11db40c1651c951edda2a4c20f1cdeb1d66e2c6ed3736b2f077d7e067aef2f76260fc6170dcd7e5ae0ddc8daf943b543e43'
            '11f08714d5b32524758efcb24610ce7b64629edcd6469c720babdb1ed0d68cc112521921adc39cce1ee73d7da93434bb5f857fa60a43855ee2fa0bac169188b8')

package() {
  install -Dm644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm755 "${srcdir}/feather-$pkgver" "$pkgdir/opt/$_pkgname/feather"

  # create symlinks
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/feather "${pkgdir}/usr/bin"
}
