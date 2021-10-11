# Maintainer: mnabila nblid48[at]gmail[dot]com

pkgname=quran-rofi
pkgver=0.0.1
pkgrel=1
pkgdesc="Al-Quran dengan Terjemahan Indonesia"
url="https://github.com/nesstero/Al-Quran-Rofi"
license=('MIT')
source=("${pkgname}::git+https://github.com/nesstero/Al-Quran-Rofi.git")
arch=('any')
sha256sums=('SKIP')
depends=('rofi' 'python-dynmen' 'python-traitlets' 'python-beautifulsoup4' 'python-lxml' 'python-pyperclip')

package() {
    cd $srcdir/$pkgname
    mkdir -p "${pkgdir}/usr/share/${pkgname}/"
    cp -r assets "${pkgdir}/usr/share/${pkgname}/"
    install -Dm755 Quran.py "${pkgdir}/usr/share/${pkgname}/quran-rofi"
    mkdir -p "${pkgdir}/usr/bin/"
    ln -s "${pkgdir}/usr/share/${pkgname}/quran-rofi" "${pkgdir}/usr/bin/"
}

#vim: syntax=sh
