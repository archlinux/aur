# Maintainer:	Simon Legner <Simon.Legner@gmail.com>
# Maintainer:	Filippo Berto <berto.f at protonmail dot com>
# Contributor: Viktor Hundahl Strate <viktorstrate@gmail.com>

_gitname=tinyMediaManager
pkgname=tiny-media-manager
pkgver=2.9.15
_sha1=69b6104
pkgrel=2
pkgdesc="A multi-OS media managment tool"
arch=('any')
url="https://www.tinymediamanager.org/"
license=('Apache')
depends=('libmediainfo' 'java-runtime')
install=tinyMediaManager.install
noextract=("tmm_${pkgver}_${_sha1}_linux.tar.gz")
source=("https://release.tinymediamanager.org/dist/tmm_${pkgver}_${_sha1}_linux.tar.gz"
        "tinyMediaManager.install"
			  "tinyMediaManager.desktop"
				"tinymediamanager"
				"tinymediamanager-cli")

package() {
	cd "$srcdir"

	tar -xf tmm_"$pkgver"_*_linux.tar.gz
	mkdir -p "$pkgdir/usr/share/$_gitname"
	cp -r {lib/,locale/,plugins/,templates/,splashscreen.png,tmm.jar,tmm.png} "$pkgdir/usr/share/$_gitname"

	# Install desktop entry
	install -D "$srcdir/tinyMediaManager.desktop" "$pkgdir/usr/share/applications/tinyMediaManager.desktop"

	# Install launch scripts
	install -D "$srcdir/tinymediamanager-cli" "$pkgdir/usr/bin/tinymediamanager-cli"
	install -D "$srcdir/tinymediamanager" "$pkgdir/usr/bin/tinymediamanager"
}

sha256sums=('f88f74b9d815f19baeaa962037035e3491e94159a5cdb81f3b04808b6b2cce32'
            '49bd16ee848ae21f1c02e408469e5c09c253e6ffe353d7e65434298a1092f010'
            '02bbfd492d10114cd314fc24fd7016532b0b992077d722d8bfccc4f99a79b7a3'
            '29b3c0b610cbf764c037368f2924bc23354330cee05ed737617a18aba9696701'
            '2c789228aa33e58c5883001b8c888fc220baba36635d5acb4b1cf8e4d7afc6b6')
