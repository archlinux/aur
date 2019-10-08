# Maintainer: VVL <me@ivvl.ru>
# Contributor: VVL <me@ivvl.ru>

pkgname=mtprotoproxy
pkgver=1.0.7
pkgrel=1
pkgdesc="Telegram MTProto proxy written in pure python"
arch=(any)
url="https://github.com/alexbers/mtprotoproxy"
license=('MIT')
source=("https://github.com/alexbers/mtprotoproxy/archive/v$pkgver.tar.gz"
        "mtprotoproxy.service")
depends=('python' 'python-pycryptodome')
sha256sums=('6c279ccd89f3c942c7d764f6f98227a1d6a5d9c45c868199b6572431994b10a3'
            'cd993b52610d68361a3faf9500b744f5d5e4e8eb3e79effc36098576f24b950c')
backup=('etc/mtprotoproxy.conf')
package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "mtprotoproxy.py" "$pkgdir/usr/bin/mtprotoproxy"
	install -Dm644 config.py "$pkgdir/etc/mtprotoproxy.conf"
	install -Dm644 README.md -t "$pkgdir/usr/share/docs/$pkgname"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 "$srcdir/mtprotoproxy.service" "$pkgdir/etc/systemd/system/mtprotoproxy.service"
}
