# Maintainer: Gyara <laxect39@gmail.com>
# Maintainer: Nanozuki <pt.wenhan@gmail.com>

pkgname=dantalian-rs
_realname="${pkgname%-rs}"
pkgver=0.2.1
pkgrel=2
pkgdesc="A nfo file generator for your anime. Source from Bangumi."
url="https://github.com/nanozuki/dantalian"
makedepends=('cargo')
depends=('openssl')
arch=('i686' 'x86_64')
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nanozuki/$_realname/archive/v$pkgver.tar.gz")
sha512sums=('6ee2ba3d46a22be138193e77109a655cf3faf35f6f85c48f2a87ea23cc6e4b9fd9e56dd2d5481c3c47abe95ca01db9f2e1142a3c3bf95671cda676d9dbdfe342')

build() {
	cd "$_realname-$pkgver"
	cargo build --release --target-dir "./target"
}

package() {
	cd "$_realname-$pkgver"
	install -Dm755 "target/release/$_realname" "$pkgdir/usr/bin/$_realname"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_realname}"
}

# vim:set ts=2 sw=2 et:
