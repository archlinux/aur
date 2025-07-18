# Maintainer: Zhanibek Adilbekov <zhnaibek.adilbekov@proton.me>
# shellcheck disable=2034,2154,2164
pkgname=postgrestools-bin
pkgver=0.10.0
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
b2sums_x86_64=('984c452821e0fdf1561cc87f13c9ec5c2309b251bd7bef6a68be34b1c8491e5530cd828575b96384aa02077e6c402aed5f39600baa9b6cf7e304465de7cd8dd4')
b2sums_aarch64=('8794c0f825b04b9b0d876c31812ee53f54980ec4da1ef59bfc11cc21de664f7832de17d9006fb9da2134117b72279b77865199cb824e5172d08419a1de921ce1')

package() {
	install -Dm755 "$srcdir/$pkgname-${epoch:+"$epoch:"}$pkgver-$pkgrel-$CARCH.bin" "$pkgdir/usr/bin/postgrestools"
	install -Dm644 "$srcdir/$pkgname-${epoch:+"$epoch:"}$pkgver-$pkgrel-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
