# Maintainer: aoisensi <me@aoisensi.info>

pkgname=ttf-killgothic-u
pkgver=0.99b
pkgrel=1
pkgdesc='A free ttf font with the theme of the anime "Kill Me Baby".'
arch=('any')
url='http://www.getsuren.com/en/killgoU.html'
license=('custom')
source=('GN-KillGothic_U.zip::http://getsuren.com/download/download.cgi?name=GN-KillGothic_U.zip')
sha256sums=('e0ec9c9a8058e928b08bf8df7ddd6fb238db05e3f63d8c44493e246725a48177')

build() {
  sed -n "/・It's not indispensable/,/using these fonts./p" readme_en.txt > LICENSE
}

package() {
  install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
  install -m 644 GN-KillGothic-U-KanaNA.ttf "${pkgdir}/usr/share/fonts/TTF/GN-KillGothic-U-KanaNA.ttf"
  install -m 644 GN-KillGothic-U-KanaNB.ttf "${pkgdir}/usr/share/fonts/TTF/GN-KillGothic-U-KanaNB.ttf"
  install -m 644 GN-KillGothic-U-KanaO.ttf "${pkgdir}/usr/share/fonts/TTF/GN-KillGothic-U-KanaO.ttf"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}