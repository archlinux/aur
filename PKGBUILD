# Maintainer: mnabila nblid48[at]gmail[dot]com

pkgname=quran-rofi
pkgver=0.0.1
pkgrel=4
pkgdesc="Al-Quran dengan Terjemahan Indonesia"

url="https://github.com/nesstero/Al-Quran-Rofi"
license=('MIT')

source=("${pkgname}-${pkgver}::git+https://github.com/nesstero/Al-Quran-Rofi.git")
arch=('any')
sha256sums=('SKIP')

depends=('python-pyrof-git' 'python-beautifulsoup4' 'python-lxml' 'python-pyperclip')

package() {
    mkdir -p "${pkgdir}/usr/share/${pkgname}/"
    mkdir -p "${pkgdir}/usr/share/fonts/${pkgname}/"

    cd $srcdir/$pkgname-$pkgver
    mv "assets/Font/Al Qalam Quran Majeed.ttf" "${pkgdir}/usr/share/fonts/${pkgname}/"
    cp -r assets "${pkgdir}/usr/share/${pkgname}/"
    cp Quran.py "${pkgdir}/usr/share/${pkgname}/"

    cd ../..
    install -Dm755 quran-rofi "${pkgdir}/usr/bin/quran-rofi"
}

#vim: syntax=sh
