# Maintainer : Daniel Chesters <archlinux@coin-coin.xyz>

pkgname=i3wsr
pkgver=3.1.0
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
b2sums=('7ce1b46e25ac608430441d8d9662fc6da0b7c8aec3050ba9bf87fbc1b5b94c4c7549646e7b8e10c0b3cc41855e1213215ff09515451b3a392b222b8f9ac4e562')
