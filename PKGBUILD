# Maintainer: Abdullah <abdullah at abdullah dot today>
pkgname=ttf-urdufonts
pkgdesc="Urdu fonts (Jameel Noori Nastaleeq (+kasheeda), Nafees Web Naskh, PDMS Saleem Quran Font) and font configuration to set Jameel Noori Nastaleeq as default font for Urdu"
license=('custom')
pkgver=1.3
pkgrel=3
arch=('any')
url="http://urdu.ca"
source=("http://urdu.ca/UrduFonts.zip" "90-fonts-urdu.conf" "LICENSE")
md5sums=('0229941c51a67acb3669c783cd384379' 'e5792695a520f78fdf555d5d802ba996'  
'3566d27995e9761c29148be747fcf1b5')
install=$pkgname.install

package() {
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -d "$pkgdir/usr/share/fonts/TTF"
  cp -dpr --no-preserve=ownership "$srcdir/"*.ttf "$pkgdir/usr/share/fonts/TTF/"
  install -D -m644 90-fonts-urdu.conf "$pkgdir/etc/fonts/conf.d/90-fonts-urdu.conf"
}

