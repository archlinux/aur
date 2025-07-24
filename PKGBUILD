# Maintainer : Daniel Chesters <archlinux@coin-coin.xyz>

pkgname=i3wsr
pkgver=3.1.2
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
b2sums=('4b6b6bbe95d6c41877e19d82a5524543fb3c39b364b0627f8034cc37558adb9e96ed202f6b79dd37d16e576197d21798c2b35eac3d621eae46e98aebd9ff70c7')
