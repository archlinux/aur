# Maintainer: John Turner <jturner.usa+au@gmail.com>

pkgname=ezzram
depends=("python-psutil")
provides=("$pkgname")
conflicts=("$pkgname")
pkgver=1
pkgrel=1
arch=("x86_64")

source=("ezzram.conf" "ezzram.py" "ezzram.service")

sha256sums=("6ba42f0dbe507c1c405e73eb8dc768cc916aaa0ed4f4930e64967219c90c2e86"
            "654f13f0d34570c51cd3f9d8f5183ddbde82afc06a70d877f4970ba694f96f10"
            "187a0c81d8843e174d3b3a1e1d73bd11b7f802d3302c1cb8bb2cf8f6cf1ff08d")

package()
{
	install -Dm755 "$srcdir/$pkgname.py" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
	install -Dm644 "$srcdir/$pkgname.conf" "$pkgdir/etc/$pkgname.conf"
}
