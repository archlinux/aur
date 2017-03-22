# Maintainer: Justin Gross <justin@jgross.tech>

pkgname=skype-for-linux
pkgver=5.0.0.5
pkgrel=1
pkgdesc="Skype for Linux BETA from Microsoft"
arch=('i686' 'x86_64')
url="https://www.skype.com/en/download-skype/skype-for-computer/"
license=('custom:microsoft')
source_x86_64=("https://go.skype.com/skypeforlinux-64-alpha.deb")
md5sums_x86_64=('ac0c07a5b285a22ef0414dd5cd33d13f')
prepare() {
  # Extract zipped tar files from Ubuntu deb package
	tar -xf data.tar.xz
}
package() {
	# Prepare the opt directory
	install -dm755 "$pkgdir/"{opt,usr/{bin,share/{icons/hicolor/{16x16,32x32,256x256,512x512,1024x1024},pixmaps,doc,applications}}}

	# Copy the directory containing the freelancer binary and application files
  cp -R "$srcdir/opt/skypeforlinux" "$pkgdir/opt/skypeforlinux"
  cp -R "$srcdir/usr/share/skypeforlinux" "$pkgdir/usr/share/skypeforlinux"

	# Install the freelancer icon files to the appropriate locations
  install -Dm644 "$srcdir/usr/share/applications/skypeforlinux.desktop" "$pkgdir/usr/share/applications/skypeforlinux.desktop"

  install -Dm644 "$srcdir/usr/share/doc/skypeforlinux/copyright" "$pkgdir/usr/share/doc/skypeforlinux/copyright"
  install -Dm644 "$srcdir/usr/share/doc/skypeforlinux/third-party_attributions.html" "$pkgdir/usr/share/doc/skypeforlinux/third-party_attributions.html"

  install -Dm644 "$srcdir/usr/share/icons/hicolor/16x16/apps/skypeforlinux.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/skypeforlinux.png"
  install -Dm644 "$srcdir/usr/share/icons/hicolor/32x32/apps/skypeforlinux.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/skypeforlinux.png"
  install -Dm644 "$srcdir/usr/share/icons/hicolor/256x256/apps/skypeforlinux.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/skypeforlinux.png"
  install -Dm644 "$srcdir/usr/share/icons/hicolor/512x512/apps/skypeforlinux.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/skypeforlinux.png"
  install -Dm644 "$srcdir/usr/share/icons/hicolor/1024x1024/apps/skypeforlinux.png" "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/skypeforlinux.png"
  install -Dm644 "$srcdir/usr/share/pixmaps/skypeforlinux.png" "$pkgdir/usr/share/pixmaps/skypeforlinux.png"

  install -Dm755 "$srcdir/usr/bin/skypeforlinux" "$pkgdir/usr/bin/skypeforlinux"
}
