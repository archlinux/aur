# Maintainer: Zhanibek Adilbekov <zhnaibek.adilbekov@proton.me>
# shellcheck disable=2034,2154,2164
pkgname=posgrestools-bin
pkgver=0.2.1
pkgrel=1
pkgdesc='A collection of language tools and a Language Server Protocol (LSP) implementation for Postgres, focusing on developer experience and reliable SQL tooling'
arch=('x86_64' 'aarch64')
url='https://pgtools.dev'
license=('MIT')
provides=('posgrestools')
conflicts=('posgrestools')
source=($pkgname-${epoch:+"$epoch:"}$pkgver-$pkgrel-LICENSE::"https://github.com/supabase-community/postgres_lsp/raw/refs/tags/${pkgver}/LICENSE")
source_x86_64=("$pkgname-${epoch:+"$epoch:"}$pkgver-$pkgrel-x86_64.bin::https://github.com/supabase-community/postgres_lsp/releases/download/${pkgver}/postgrestools_x86_64-unknown-linux-gnu")
source_aarch64=("$pkgname-${epoch:+"$epoch:"}$pkgver-$pkgrel-aarch64.bin::https://github.com/supabase-community/postgres_lsp/releases/download/${pkgver}/postgrestools_aarch64-unknown-linux-gnu")
b2sums=('7ae0aa37903c2bb0ebba4dbf11292947a42c522bdc4fa762f2407a2546091047dbe1b3057007c35769ab3ff414c8ca3896ff6b178f94df3e1cff4e616466edc0')
b2sums_x86_64=('7eee1051fdc7ffbc75ad305f618c0265865d5d0db5f1c68cbcc7c1b5db65070d6c27e67a8548d1a502939169494aeaddeeb325defb351e1c4a23a1da53ab7e7e')
b2sums_aarch64=('dd92a8cb9aeb033a7bb90c937f1584c110fa5a73a2744a59450a1bb4bdef8f16d3bd4b238cab3087730de1e0e14306e8dde58e47684f108b0252f9a8a03fd0bc')

package() {
	install -Dm755 "$srcdir/$pkgname-${epoch:+"$epoch:"}$pkgver-$pkgrel-$CARCH.bin" "$pkgdir/usr/bin/postgrestools"
	install -Dm644 "$srcdir/$pkgname-${epoch:+"$epoch:"}$pkgver-$pkgrel-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
