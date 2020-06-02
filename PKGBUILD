# Maintainer:	Simon Legner <Simon.Legner@gmail.com>
# Maintainer:	Filippo Berto <berto.f at protonmail dot com>
# Contributor: Viktor Hundahl Strate <viktorstrate@gmail.com>

_gitname=tinyMediaManager
pkgname=tiny-media-manager
pkgver=3.1.6
pkgrel=2
pkgdesc="A multi-OS media managment tool"
arch=('any')
url="https://www.tinymediamanager.org/"
license=('Apache')
depends=('libmediainfo' 'java-runtime')
install=tinyMediaManager.install
noextract=("tmm_${pkgver}_linux.tar.gz")
source=("https://release.tinymediamanager.org/v3/dist/tmm_${pkgver}_linux.tar.gz"
        "tinyMediaManager.install"
			  "tinyMediaManager.desktop"
				"tinymediamanager"
				"tinymediamanager-cli"
				"tinymediamanager.JAVA_OPTS")

package() {
	destpath="$pkgdir/usr/share/$_gitname"
	mkdir -p "$destpath"
	tar -xvf "tmm_${pkgver}_linux.tar.gz" -C "$destpath"
	install -m644 tinymediamanager.JAVA_OPTS "$destpath/tmm.JAVA_OPTS"

	# Install desktop entry
	install -D "$srcdir/tinyMediaManager.desktop" "$pkgdir/usr/share/applications/tinyMediaManager.desktop"
	install -D "$destpath/tmm.png" "$pkgdir/usr/share/pixmaps/tmm.png"

	# Install launch scripts
	install -D "$srcdir/tinymediamanager-cli" "$pkgdir/usr/bin/tinymediamanager-cli"
	install -D "$srcdir/tinymediamanager" "$pkgdir/usr/bin/tinymediamanager"
}

sha1sums=('354f74ec00c5c1604a078af237fb1fa8b90b9cf0'
          '15a8e62ce1c2700289503b5b99e0c9d9d5cf6d15'
          '0c6aeaf59c192c91057635d652f80527b561d7b5'
          '9ce3458df361acba4873bedc1aaec74e740b35be'
          '14b2aa5cba1a7fa7bb31ea2dcee7425c290a0340'
          'a8501e0876bef796700b66b7999d55f43c817ff2')
sha256sums=('80b8fdda02a5440bddb2c3ae75ed13aaf3b9f29bf2630b80c18a60e044c1001a'
            '49bd16ee848ae21f1c02e408469e5c09c253e6ffe353d7e65434298a1092f010'
            '02bbfd492d10114cd314fc24fd7016532b0b992077d722d8bfccc4f99a79b7a3'
            '4bf36dd16bfc02a39ddde88cfcf30b4f4a5f0b08d2b34ffbab03f6553f57d596'
            '2d3df36c67a710b03b8fea3ac58c49307da8db22b7c6f8fd0011552fe94dde26'
            '39fb926866f16064156847dd1ffd4c5598ac733e1c65b580d0db9c1d9c170dae')
