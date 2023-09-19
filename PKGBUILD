# Maintainer: Alesar1
pkgname=fourier-series
pkgver=1.6
pkgrel=1
pkgdesc="Applet that demonstrates Fourier series written by Paul Falstad"
arch=("any")
url="https://www.falstad.com/fourier-java"
license=("GPL")
depends=("java-runtime>=6" "hicolor-icon-theme")
makedepends=("unzip" "imagemagick")
source=("https://www.falstad.com/fourier-java/fourier.zip"
        "$pkgname"
        "$pkgname.desktop")
sha256sums=('d7bbdee85ed69bd2fb6673949e5a071d830a6fef95e2d79cc876d0d86a18ccc4'
            '15f6d54b7a5a2ebe58989a4763e924f1499ab03e51d3910177ab2887b421443a'
            '83c912a4c31f650329a403b96db55e27bb411c3811eaf9d7cb7098edb96af51d')

package() {
	cd "$srcdir"

	mkdir -pm 755 "${pkgdir}/opt/$pkgname"
	unzip fourier.zip -d "${pkgdir}/opt/$pkgname"
	chmod -R 644 "${pkgdir}/opt/$pkgname"
	chmod -R +X "${pkgdir}/opt/$pkgname"

	install -D -m755 "${srcdir}/$pkgname" "${pkgdir}/usr/bin/$pkgname"
	install -D -m644 "${srcdir}/$pkgname.desktop" "${pkgdir}/usr/share/applications/$pkgname.desktop"

	mkdir -pm 755 "${pkgdir}/usr/share/icons/hicolor/16x16/apps"
	convert "${pkgdir}/opt/$pkgname/favicon.ico" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/fourier.png"
}

