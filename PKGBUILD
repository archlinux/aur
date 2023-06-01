# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=featherwallet-bin
_pkgname=featherwallet
pkgver=2.4.9
pkgrel=1
pkgdesc='A free, open-source Monero light wallet.'
url='https://featherwallet.org'
arch=('x86_64')
license=('custom')
conflicts=('featherwallet' 'monero-feather' 'monero-feather-git' 'monero-feather-bin' 'monero-feather-appimage' 'featherwallet-appimage')
source=("$url/files/releases/linux/feather-$pkgver-linux.zip"
        "https://raw.githubusercontent.com/feather-wallet/feather/master/LICENSE")
sha512sums=('2844ac7768354214c2151ac8d0e0afe6ff8d2e72604a42c2c1f16980ac2886b4edd840b7c4b89b5511ea2d3421611b000b734002c0c9ac2f544dee10640f5f7f'
            'ce126df857bb68268f4ef5743b7eb14ac8be8b77054ca631ca5e6dcf1dab9d75e552cd29d63685b8241acb3308f7c63165d9abf53b685f74aba735949c79388c')

package() {
  install -Dm644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm755 "${srcdir}/feather-$pkgver" "$pkgdir/opt/$_pkgname/feather"

  # create symlinks
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/feather "${pkgdir}/usr/bin"
}
