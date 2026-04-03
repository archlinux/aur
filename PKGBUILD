# Maintainer: aisuneko icecat <iceneko@protonmail.ch>
pkgname=kelivo-bin
pkgver=1.1.10
pkgrel=28.1
pkgrel_ver=27
pkgdesc="A Flutter LLM Chat Client"
arch=("x86_64")
url="https://github.com/Chevey339/kelivo"
license=('AGPL-3.0-only')
depends=('gtk3' 'libnotify')
provides=('kelivo')
source=("https://github.com/Chevey339/kelivo/releases/download/v$pkgver/Kelivo_linux_$pkgver+$pkgrel_ver.tar.gz"
		"kelivo.desktop")
sha256sums=("de06c8d63568738fbeff88d3e5bad30769f5568bf4c56595fdd4c654a21e6983"
			"d70d4b0a4968c1c4b2323e7a1522850a919ca7d03c7d66026d05234aaf13449b")

package() {
        install -d "$pkgdir/opt/kelivo"
        install -Dm755 "$srcdir/kelivo" "$pkgdir/opt/kelivo/kelivo"
		cp -r "$srcdir/lib" "$pkgdir/opt/$pkgname/"
  		cp -r "$srcdir/data" "$pkgdir/opt/$pkgname/"

  		install -Dm644 "$srcdir/data/flutter_assets/assets/app_icon.png" \
  			"$pkgdir/usr/share/icons/hicolor/256x256/apps/kelivo.png"

  		install -Dm644 "$srcdir/kelivo.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  		
        install -d "$pkgdir/usr/bin"
  		ln -s "/opt/$pkgname/kelivo" "$pkgdir/usr/bin/kelivo"
}
