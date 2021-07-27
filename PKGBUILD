# Maintainer: Ma Jiehong <email at majiehong.com>
pkgname=ttf-tw
epoch=1
pkgver=20210727
pkgrel=1
pkgdesc="Set of KAI and SONG fonts from the Ministry of Education of Taiwan. These fonts follow all the official recommendations and their shapes are calligraphically correct. (TTF/UTF-8)"
arch=('any')
url="http://www.moe.gov.tw/"
license=('CC-BY-ND 3.0')
# backup source: git+https://github.com/Jiehong/TW-fonts.git
# makedepends=(git)
source=(https://language.moe.gov.tw/001/Upload/Files/site_content/M0001/edukai-4.0.zip
        https://language.moe.gov.tw/001/Upload/Files/site_content/M0001/eduSong_Unicode.zip
        https://language.moe.gov.tw/001/Upload/Files/site_content/M0001/edukai.pdf
        https://language.moe.gov.tw/001/Upload/Files/site_content/M0001/edusun.pdf)
sha512sums=('fdb346310b12357128f50a0ef93571e1fd4a77dd9289c3efb706787c327d4c5ac7917112de6fcad6dd22213740b10aa5aef2c021c0c0cc50d14bc6132b735d18'
            '2af97c4456f829d7da73d90ebdd194db480262cc36250e8e51bef581afeeead10493c00f1f06d78f0bf54cae3bc1439b251b2a97e0601e043cd0795a09d5ce67'
            '069266d54c828af59eaec425201a09affd71c5633233a14040f395d975f97f08fbab62b7d062436aed7e725c281705e08be2ee282d0b202d4ab7ad392a95e8f9'
            '2fb45aa7818652daf39fab975efe2f4ca3b7bd95b7fde7b0a76845e40ef75d37a8f3a15ce00f159d8ed94bdd0428b85c83b3bcc7c0e9b88c00b0bf72c05a84ad')

pkgver() {
  date +%4Y%m%d
}

package() {
  cd "$srcdir"
  install -Dm644 edukai-4.0.ttf "${pkgdir}/usr/share/fonts/TTF/edukai-4.0.ttf"
  install -Dm644 eduSong_Unicode.ttf "${pkgdir}/usr/share/fonts/TTF/eduSong_Unicode.ttf"
  install -Dm644 edukai.pdf "${pkgdir}/usr/share/licenses/${pkgname}/edukai.pdf"
  install -Dm644 edusun.pdf "${pkgdir}/usr/share/licenses/${pkgname}/edukai.edusun.pdf"
}
