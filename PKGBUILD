# Maintainer:	Simon Legner <Simon.Legner@gmail.com>
# Maintainer:	Filippo Berto <berto.f at protonmail dot com>
# Contributor: Viktor Hundahl Strate <viktorstrate@gmail.com>

_gitname=tinyMediaManager
pkgname=tiny-media-manager
pkgver=3.1.4
pkgrel=1
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
				"tinymediamanager-cli")

package() {
	destpath="$pkgdir/usr/share/$_gitname"
	mkdir -p "$destpath"
	tar -xvf "tmm_${pkgver}_linux.tar.gz" -C "$destpath"

	# Install desktop entry
	install -D "$srcdir/tinyMediaManager.desktop" "$pkgdir/usr/share/applications/tinyMediaManager.desktop"
	install -D "$destpath/tmm.png" "$pkgdir/usr/share/pixmaps/tmm.png"

	# Install launch scripts
	install -D "$srcdir/tinymediamanager-cli" "$pkgdir/usr/bin/tinymediamanager-cli"
	install -D "$srcdir/tinymediamanager" "$pkgdir/usr/bin/tinymediamanager"
}

sha1sums=('332d5eb54762f6613365289d0f2fc013cc1043f5'
          '15a8e62ce1c2700289503b5b99e0c9d9d5cf6d15'
          '0c6aeaf59c192c91057635d652f80527b561d7b5'
          'a2571729a1d9c3540145d589823ed13b5376f25a'
          '7ccba3334f0fd954aa497e643bb12420cc19e1dd')
sha256sums=('7ea7e6dc479287640bebb22f5faef0b2c655fba0c507d4fc87b4c2b09cdc4ab4'
            '49bd16ee848ae21f1c02e408469e5c09c253e6ffe353d7e65434298a1092f010'
            '02bbfd492d10114cd314fc24fd7016532b0b992077d722d8bfccc4f99a79b7a3'
            '68c328128b3e087ba86b27f0cc9aeab459a42f3725500ccaa574051a45e2911d'
            '71f84652ac0450b1c142654723e525ac042293d136cabf2cab82f1eab3f46532')
