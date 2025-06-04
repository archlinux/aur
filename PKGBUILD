# Maintainer : Daniel Chesters <archlinux@coin-coin.xyz>
# Contributor : Daniel Chesters <archlinux@coin-coin.xyz>
pkgname=git-who
pkgver=1.1
pkgrel=1
pkgdesc="Git blame for file trees"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/sinclairtarget/git-who"
license=('MIT')
depends=('glibc' 'git')
makedepends=('go' 'ruby-rake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sinclairtarget/$pkgname/archive/refs/tags/v$pkgver.tar.gz")

build() {
	cd "$pkgname-$pkgver" || exit
	rake
}

package() {
	cd "$pkgname-$pkgver" || exit
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
b2sums=('f8a23650b2845e0a86b7341df9086d6dd8b47ec4f82c99cf98331696c0a5c38509de8e91ed5d0ce003849f3f200aa461f192320f4faeb313da805c0d59d09357')
# vim:set ts=2 sw=2 et:
