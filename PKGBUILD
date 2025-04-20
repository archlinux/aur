# Maintainer: Zhanibek Adilbekov <zhnaibek.adilbekov@proton.me>
# shellcheck disable=2034,2154,2164
pkgname=postgrestools-bin
pkgver=0.5.0
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
b2sums_x86_64=('f36faf337bf0cfa80d869b9b7fb5bfc12701cfdc43c366c2940cc5758bb7c97b1009dacdf6025d5c886f11776cd70cb3c308e9f93208d524e91833af69b8626c')
b2sums_aarch64=('f77c394b5005e7d307870c2557570f4e53f4c90b9f00de2c1619350bfab6e67428c0ece4d85602c9ca41ad11611bd179eee03d32fc1a0b53d0611e781d83aeba')

package() {
	install -Dm755 "$srcdir/$pkgname-${epoch:+"$epoch:"}$pkgver-$pkgrel-$CARCH.bin" "$pkgdir/usr/bin/postgrestools"
	install -Dm644 "$srcdir/$pkgname-${epoch:+"$epoch:"}$pkgver-$pkgrel-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
