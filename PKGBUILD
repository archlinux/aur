# Maintainer: Sorah Fukumori <her@sorah.jp>

pkgname=mairu-bin
pkgdesc="on-memory AWS credentials agent and executor for AWS SSO and others"
pkgver=0.12.0
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/sorah/mairu"
license=('Apache-2.0')
conflicts=('mairu')
provides=("mairu=$pkgver")
source_x86_64=(mairu-$pkgver-x86_64.tar.gz::https://github.com/sorah/mairu/releases/download/v$pkgver/mairu-x86_64-unknown-linux-musl.tar.gz)
source_aarch64=(mairu-$pkgver-aarch64.tar.gz::https://github.com/sorah/mairu/releases/download/v$pkgver/mairu-aarch64-unknown-linux-musl.tar.gz)
sha256sums_x86_64=('e86f3c54b0f473d922c65a6053a9d3e2b554517af1667637a2e1923bf0a3d61b')
sha256sums_aarch64=('6231062a9d19a532a005020e9290ba6137820fae9937359b94e7316ed8ca7e40')
sha512sums_x86_64=('6cc7c8ab854c7f9f6b55b8499b1cd431bc7dffc0139e938150e0ab6c78d1ca29a47c330e9827ec3e46f6a00a62c9c697a4af6a36e4bcbaf69f3d5a5601a08c36')
sha512sums_aarch64=('8fcda70efd0a153f51ab9d9cacc5ad03805db7b6cb675e19bb3a2c326e46b7b85ce9e3d394e8ab3f22bf9435283a660a87c9977f77cbeb52e6ef40ee2ae302cf')
install=mairu-bin.install

package() {
  tar -C "$srcdir" -xf "mairu-$pkgver-$CARCH.tar.gz"
  install -Dm 755 "$srcdir/mairu" "$pkgdir/usr/bin/mairu"
}


