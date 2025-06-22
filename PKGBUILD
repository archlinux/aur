# Maintainer: Serhii Starovoitov <drommer.94@gmail.com>

pkgname=ttf-pt-astra-fact
pkgver=1.001
pkgrel=1
pkgdesc='A sans-serif font designed to be metrically equivalent to Verdana'
arch=('any')
url='https://www.paratype.ru'
license=('custom:OFL')
provides=('ttf-font' 'ttf-pt-astra-fact')
source=("http://dl.astralinux.ru/astra/stable/orel/repository/pool/main/f/fonts-pt/fonts-pt-astra-fact_${pkgver}_all.deb"
        "OFL.txt"::"https://scripts.sil.org/cms/scripts/render_download.php?format=file&media_id=OFL_plaintext&filename=OFL.txt")
sha256sums=('04e0fcb85e1728b968291d482371b6fc98167643dc525e2f4b990318c43886e3'
            'ca122f3bda0154f692817450168cb650a7fc59ef96c93582acd2e7a744d464d3')

prepare() {
  bsdtar -xf data.tar.xz -C "$srcdir/"
}

package() {
  install -Dm644 $srcdir/usr/share/fonts/truetype/ptastrafact/*.ttf -t $pkgdir/usr/share/fonts/paratype/pt-astra-fact
  install -Dm644 $srcdir/OFL.txt -t $pkgdir/usr/share/licenses/${pkgname}
}
