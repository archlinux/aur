# Maintainer: aisuneko icecat <iceneko@protonmail.ch>
pkgname=kelivo-bin
pkgver=1.3.5
pkgrel_ver=85
pkgrel=$pkgrel_ver.1
pkgdesc="A Flutter LLM Chat Client"
arch=("x86_64")
url="https://github.com/Chevey339/kelivo"
license=('AGPL-3.0-only')
depends=('gtk3' 'libnotify' 'libayatana-appindicator' 'libkeybinder3')
provides=('kelivo')
conflicts=('kelivo')
source=("https://github.com/Chevey339/kelivo/releases/download/v$pkgver/Kelivo_linux_$pkgver+$pkgrel_ver.tar.gz"
		"kelivo.desktop")
sha256sums=("3760f3dc96c48b11c619f07e2ef4bfb8df3bf08f9e23e527b72ae42c3e956a62"
			"24bc2c4cf189b1a6494a89f5e97b296bc6e13f6d68dbac0963b7372bf1acfe89")

package() {
        install -d "$pkgdir/opt/kelivo"
        install -Dm755 "$srcdir/kelivo" "$pkgdir/opt/kelivo/kelivo"
		cp -r "$srcdir/lib" "$pkgdir/opt/kelivo/"
  		cp -r "$srcdir/data" "$pkgdir/opt/kelivo/"

  		install -Dm644 "$srcdir/data/flutter_assets/assets/app_icon.png" \
  			"$pkgdir/usr/share/icons/hicolor/256x256/apps/kelivo.png"

  		install -Dm644 "$srcdir/kelivo.desktop" "$pkgdir/usr/share/applications/kelivo.desktop"
  		
        install -d "$pkgdir/usr/bin"
  		ln -s "/opt/kelivo/kelivo" "$pkgdir/usr/bin/kelivo"
}
