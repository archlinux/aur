# Maintainer : Daniel Chesters <archlinux@coin-coin.xyz>

pkgname=i3wsr
pkgver=3.1.1
pkgrel=1
pkgdesc="A small program to change the name of an i3/sway workspace based on its contents."
url="https://github.com/roosta/i3wsr"
depends=(
	'glibc'
	'gcc-libs'
)
optdepends=(
	'i3-wm'
	'sway'
)
makedepends=('cargo' 'python')
arch=('i686' 'x86_64')
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/roosta/$pkgname/archive/v$pkgver.tar.gz")

build() {
	cd "$pkgname-$pkgver" || exit
	cargo build --release
}

package() {
	cd "$pkgname-$pkgver" || exit
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
b2sums=('2ebc166916acc5305ba897b0e1d7b072df9ecef81c766e8e50a999e851ef1e7415c195bd56a5a9055aca071be031d9d33f4df3c1ae0a9a5de7c1c1b8876f2394')
