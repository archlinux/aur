# Maintainer: Michael Kogan <michael dot kogan at gmx dot net>

pkgname=php-pdf-version-converter
_extname=pdf-version-converter
pkgver=1.0.5
pkgrel=1
pkgdesc="PHP library for converting the version of PDF files (for compatibility purposes)."
arch=("any")
url="https://github.com/xthiago/pdf-version-converter"
license=('MIT')
depends=('php>=5.3' 'ghostscript')
source=("https://github.com/xthiago/pdf-version-converter/archive/v$pkgver.tar.gz")
sha256sums=('88ee7547e3618ef09b5e3bc989fe3559a196bf5f1a15c6ee56f1b52fd0570f16')

package() {
	cd "$srcdir"/$_extname-$pkgver
	install -m0644 -D "LICENSE" "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm644 -t "${pkgdir}/usr/share/php/Converter" src/Converter/*
    install -Dm644 -t "${pkgdir}/usr/share/php/Guesser" src/Guesser/*
}