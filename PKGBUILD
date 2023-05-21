# Maintainer: qwjyh <urataw421 at gmail dot com>

pkgname=sumatrapdf
pkgver=3.4.6
pkgrel=1
pkgdesc="PDF, eBook (epub, mobi), comic book (cbz/cbr), DjVu, XPS, CHM, image viewer for Windows. Small, fast, customizable, free."
arch=('x86_64')
url='https://www.sumatrapdfreader.org/free-pdf-reader'
license=('GPL3' 'BSD')
depends=('wine' 'bash')
optdepends=('ttf-ms-win11: or font data on a windows partiion'
            'ttf-ms-win11-auto: another choice')
source=('https://www.sumatrapdfreader.org/dl/rel/3.4.6/SumatraPDF-3.4.6-64.zip'
        'https://raw.githubusercontent.com/sumatrapdfreader/sumatrapdf/3.4.6rel/COPYING.BSD'
        'sumatrapdf.sh')
sha256sums=('2bb05aa8b74bc748bc1f6a2b6f6ec4ba22bd5b1eaeec767d0a7f97cfd436d40d'
            'ff33648659aa06892ed13a731588a57006fafee2f848d35f70bf273a13cf9d27'
            '9113c6a594fe9b2f2dc800345396c97c3516d42d40bbc1ace6b34d805c0a3d7b')

package() {
  # license
  install -Dm644 COPYING.BSD "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.BSD"
  # binary and start script
  install -Dm755 "SumatraPDF-${pkgver}-64.exe" "$pkgdir/usr/share/$pkgname/sumatrapdf.exe"
  touch "$pkgdir/usr/share/$pkgname/SumatraPDF-settings.txt"
  install -Dm755 "$srcdir/sumatrapdf.sh" "$pkgdir/usr/bin/$pkgname"

  echo "You may need MS fonts for non-latin characters."
}
