# Maintainer: mnabila nblid48[at]gmail[dot]com

pkgname=quran-rofi
pkgver=0.0.1
pkgrel=2
pkgdesc="Al-Quran dengan Terjemahan Indonesia"
url="https://github.com/nesstero/Al-Quran-Rofi"
license=('MIT')
source=("${pkgname}-${pkgver}::git+https://github.com/nesstero/Al-Quran-Rofi.git")
arch=('any')
sha256sums=('SKIP')
depends=('rofi' 'python-dynmen' 'python-traitlets' 'python-beautifulsoup4' 'python-lxml' 'python-pyperclip')

package() {
    cd $srcdir/$pkgname-$pkgver
    mkdir -p "${pkgdir}/usr/share/${pkgname}/"
    cp -r assets "${pkgdir}/usr/share/${pkgname}/"
    cp Quran.py "${pkgdir}/usr/share/${pkgname}/"

    cd ../..
    install -Dm755 quran-rofi "${pkgdir}/usr/bin/quran-rofi"
}

#vim: syntax=sh
