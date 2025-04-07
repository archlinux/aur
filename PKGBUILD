# Maintainer: Zhanibek Adilbekov <zhnaibek.adilbekov@proton.me>
# shellcheck disable=2034,2154,2164
pkgname=postgrestools-bin
pkgver=0.3.1
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
b2sums_x86_64=('26d801da5a53abc69297a52f74e21aae09f77de48da2b437391b4539607db9a8d64376b474e3b4152409fc0d69c2d1af91b9835a3aa8c31270e88b441ecb6bd7')
b2sums_aarch64=('64fa5c1099f489f3596076f8f38ce971d8ee7d30d60da20a9e653c3c42ff9b30cf7f262b9e549b7b81e44cee9c470b2b5d73a1593b7b2e24750cfa84c3069061')

package() {
	install -Dm755 "$srcdir/$pkgname-${epoch:+"$epoch:"}$pkgver-$pkgrel-$CARCH.bin" "$pkgdir/usr/bin/postgrestools"
	install -Dm644 "$srcdir/$pkgname-${epoch:+"$epoch:"}$pkgver-$pkgrel-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
