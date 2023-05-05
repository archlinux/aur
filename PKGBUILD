# Maintainer: smsteward <smstewa4@protonmail.com>
# Contributer: DannyChain <dev@dannychain.anonaddy.me>

_pkgname="app-outlet"
pkgname="$_pkgname-bin"
pkgver=2.1.0
pkgrel=2
pkgdesc="A universal Linux app store"
arch=(x86_64)
url="https://github.com/AppOutlet/AppOutlet"
license=(MIT)
source=(
    "$url/releases/download/v$pkgver/$_pkgname-$pkgver.tar.gz"
    "app-outlet.desktop"
    "LICENSE"
    "icon.png"
)
sha256sums=('cd749f24501606b990008f3fa824a3bdc11fea97ef37215f2722baca49ccf529'
            '9a3579ceb0871515d607bf5f31e59f337a8d0fabd91b0f462f5fec9132842721'
            'c24c91646674659de06c8dad229b589608a69be9403433b4b5efe856db4cecb8'
            'eed1d87a3f89afbd73898d331bcb484afc3862a0b67bc8b47d5c29aa97c55e5c')
prepare() {
	bsdtar -xf "$_pkgname-$pkgver.tar.gz"
}
package() {
	cd $srcdir
	cp -a "$_pkgname-$pkgver" "$pkgdir/opt"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 icon.png -t "$pkgdir/usr/share/pixmaps/$_pkgname.png"
	install -Dm 644 $_pkgname.desktop -t "$pkgdir/usr/share/applications"
}

