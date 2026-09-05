# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=shunpo
pkgver=1.0.5
pkgrel=1
pkgdesc="Minimalist, fast directory bookmarking and navigation for Bash"
arch=('any')
url="https://github.com/egurapha/Shunpo"
license=('MIT')
depends=('bash')
_tag="v1.0.5"
_srcdir="Shunpo-1.0.5"
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/egurapha/Shunpo/tar.gz/refs/tags/$_tag")
sha256sums=('067335234b8da0357cf5fd5e2b4914654661cb0292919dc2e024b39e53878913')

package() {
	cd "$_srcdir"
	install -d "$pkgdir/usr/share/$pkgname"
	cp -r ./* "$pkgdir/usr/share/$pkgname/"
	rm -f "$pkgdir/usr/share/$pkgname/install.sh"
	if [ -f LICENSE ]; then
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	fi
}
