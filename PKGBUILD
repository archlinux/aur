# Maintainer: Jah Way <jahway603 at tutanota dot de>

pkgname=featherwallet-bin
_pkgname=featherwallet
pkgver=2.9.1
pkgrel=2
pkgdesc='A free, open-source Monero light wallet.'
url='https://featherwallet.org'
arch=('x86_64')
license=('custom')
provides=('featherwallet' 'feather-wallet')
conflicts=('featherwallet' 'featherwallet-appimage' 'feather-wallet' 'monero-feather' 'monero-feather-git' 'monero-feather-bin' 'monero-feather-appimage' 'feather-wallet-bin')
source=("https://github.com/feather-wallet/feather/releases/download/$pkgver/feather-$pkgver-linux.zip"
        "LICENSE-$pkgver-$pkgrel::https://raw.githubusercontent.com/feather-wallet/feather/master/LICENSE")
sha512sums=('3896498397826563659b347827f8981feaf1cd5ea6d582959a78044b935c5260e343afd7e632f74c00e6cc31c986b4627288670e18cae9c00faf5073ec67eedc'
            'a539d3639473eb197a374dc48c8f0096e389a8b5afb6c16a45a93dce44d701c0aeae5091f6e671738f2fff9b92ebe90447c5f974912f52527b0ed08c3613926d')

package() {
  install -Dm644 "${srcdir}/LICENSE-$pkgver-$pkgrel" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm755 "${srcdir}/feather-$pkgver" "$pkgdir/usr/bin/feather"
}
