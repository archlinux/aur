# Maintainer: aisuneko icecat <iceneko@protonmail.ch>
pkgname=kelivo-bin
pkgver=1.2.3
pkgrel=67.1
pkgrel_ver=67
pkgdesc="A Flutter LLM Chat Client"
arch=("x86_64")
url="https://github.com/Chevey339/kelivo"
license=('AGPL-3.0-only')
depends=('gtk3' 'libnotify' 'libayatana-appindicator' 'libkeybinder3')
provides=('kelivo')
conflicts=('kelivo')
source=("https://github.com/Chevey339/kelivo/releases/download/v$pkgver/Kelivo_linux_$pkgver+$pkgrel_ver.tar.gz"
		"kelivo.desktop")
sha256sums=("f0f05047c311ecbcb952d13b8426f117c13f51b4f137ac95316ff6b50c62c23e"
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
