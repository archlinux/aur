# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=featherwallet-bin
_pkgname=featherwallet
pkgver=2.4.0
pkgrel=1
pkgdesc='A free, open-source Monero light wallet.'
url='https://featherwallet.org'
arch=('x86_64')
license=('custom')
conflicts=('featherwallet')
source=("$url/files/releases/linux/feather-$pkgver-linux.zip"
        "https://raw.githubusercontent.com/feather-wallet/feather/master/LICENSE")
sha512sums=('484bc9b7a886ecd3cf16c4ebde97a832c92f7e1bfd9350ea79ba81d1faebb0b2b060508e7474b62c98ad029eb596b666483fe8fd863d8c10d0fa574436498ca8'
            'ce126df857bb68268f4ef5743b7eb14ac8be8b77054ca631ca5e6dcf1dab9d75e552cd29d63685b8241acb3308f7c63165d9abf53b685f74aba735949c79388c')

package() {
  install -Dm644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm755 "${srcdir}/feather-$pkgver" "$pkgdir/opt/$_pkgname/feather"

  # create symlinks
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/feather "${pkgdir}/usr/bin"
}
