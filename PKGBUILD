# Maintainer: Zhanibek Adilbekov <zhnaibek.adilbekov@proton.me>
# shellcheck disable=2034,2154,2164
pkgname=postgrestools-bin
pkgver=0.13.0
pkgrel=1
pkgdesc='A collection of language tools and a Language Server Protocol (LSP) implementation for Postgres, focusing on developer experience and reliable SQL tooling'
arch=('x86_64' 'aarch64')
url='https://pgtools.dev'
license=('MIT')
provides=('postgrestools')
conflicts=('postgrestools')
source=($pkgname-${epoch:+"$epoch:"}$pkgver-$pkgrel-LICENSE::"https://github.com/supabase-community/postgres_lsp/raw/refs/tags/${pkgver}/LICENSE")
source_x86_64=("$pkgname-${epoch:+"$epoch:"}$pkgver-$pkgrel-x86_64.bin::https://github.com/supabase-community/postgres_lsp/releases/download/${pkgver}/postgrestools_x86_64-unknown-linux-gnu")
source_aarch64=("$pkgname-${epoch:+"$epoch:"}$pkgver-$pkgrel-aarch64.bin::https://github.com/supabase-community/postgres_lsp/releases/download/${pkgver}/postgrestools_aarch64-unknown-linux-gnu")
b2sums=('7ae0aa37903c2bb0ebba4dbf11292947a42c522bdc4fa762f2407a2546091047dbe1b3057007c35769ab3ff414c8ca3896ff6b178f94df3e1cff4e616466edc0')
b2sums_x86_64=('460ef3e0204fcc5c04e3eeb6d8f7dc31a024f5bd206c96d05452568affd24f11032ea068b5ed6777e3454fa7cdcb50002c2d7d0e58b8403b37f16ca762e5896e')
b2sums_aarch64=('f0e478855ae3a766f3decb996f78614cdb8401cdf35cb9328d53d582f4d23d78b8b149b45dbdbd8c04ba99e5e0ef91b5f4053a635ef82269db88f3217b3c3316')

package() {
	install -Dm755 "$srcdir/$pkgname-${epoch:+"$epoch:"}$pkgver-$pkgrel-$CARCH.bin" "$pkgdir/usr/bin/postgrestools"
	install -Dm644 "$srcdir/$pkgname-${epoch:+"$epoch:"}$pkgver-$pkgrel-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
