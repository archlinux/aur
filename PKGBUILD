# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
pkgname=slack-cli
pkgver=0.18.0
pkgrel=3
pkgdesc="Powerful Slack CLI via pure bash. Rich messaging, uploads, posts, piping, oh my!"
arch=('any')
url="https://github.com/rockymadden/slack-cli"
license=('MIT')
depends=('bash')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/rockymadden/slack-cli/archive/v$pkgver.tar.gz"
	"$pkgname.patch"
	)

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	mv src/slack src/slack-cli
	patch --strip=1 --input=../$pkgname.patch
}

package() {
	cd "$pkgname-$pkgver"
	make install bindir="$pkgdir/usr/bin" etcdir="$pkgdir/etc"
}

md5sums=('d7df2879cce8dcd5bbe20aec60f466a4'
         '30dda14cc600c1df69b95c8ef349682d')
