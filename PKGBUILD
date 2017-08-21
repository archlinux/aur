# Maintainer: DeedleFake <deedlefake at users dot noreply dot github dot com>
pkgname=iota-wallet-bin
pkgver=2.4.0
pkgrel=1
pkgdesc="The official desktop wallet of the IOTA project."
arch=(x86_64)
url="https://iota.org"
license=('GPL')
depends=(gconf nss libxss libxtst gtk2 alsa-lib java-environment)
provides=(iota)
source=("https://github.com/iotaledger/wallet/releases/download/v$pkgver/iota-$pkgver.tar.gz"
				"iota-wallet.sh"
				"iota-wallet.desktop"
				"iota.svg")
md5sums=('f3a1c6db3e7a9e5e2ebb58df2a12a636'
         '814c1c0deb77202cc59f34134466e409'
         '7cd392933aad6c17bf72c4affed42af5'
         '31b7ae8553bcb5018e02ffd9315363d6')
sha512sums=('a9ac6eff73c30f2d2993bb8a8ec550ce68073b1a9bbf2a559e21c4bbe4fa873924138148f7ca05017b90b59b7974572bdd9f6cd20f44f7770db7d6ab0b9891f7'
            '35a106e85244c75216b2ea13b67dbb806f00e7817cf267d3faf3d74057e7a648505c309069abcb88c49aa1d502ee658d42cf251adc89141fc0d67c42eff49d81'
            '252b682b2d2ed66184c0c2b577f619ac09c3e88a17c40a3a9e4da8b744b534f978cce89566a60b0c23ae3756bb4fc6dcd47690dc5166606f61086edeed208ee3'
            '0bba31e655fbafad65862a98e36890f6e5f8b1707f4c5da2c69b7d62fe1e932cee89f9624fcc92e77ae62ea6adb69f3bb5d0b871d729bbb85b92dc6a795816fa')

package() {
	mkdir "$pkgdir/opt"
	cp -a "iota-$pkgver" "$pkgdir/opt/iota-wallet"

	install -Dm755 "iota-wallet.sh" "$pkgdir/usr/bin/iota-wallet"

	install -D "iota-wallet.desktop" "$pkgdir/usr/share/applications/iota-wallet.desktop"
	install -D "iota.svg" "$pkgdir/usr/share/pixmaps/iota.svg"
}
