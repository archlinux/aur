# Maintainer: Yangtse Su <yangtsesu@gmail.com>

pkgname=(alibaba-puhuiti alibaba-sans)
pkgver=1.01
pkgrel=3
pkgdesc="Alibaba PuHuiTi fonts"
arch=(any)
license=(custom)
url=https://ics.alibaba.com/font/alibaba-sans
makedepends=(unzip)
source=("$pkgname-$pkgver.zip::https://ics-static.oss-cn-hangzhou.aliyuncs.com/static/ucan/ucan_alibaba_font.zip?spm=0.font.0.0.e21dbbcfIGV8il&file=ucan_alibaba_font.zip")
sha512sums=('e2cac62e55a96cc641516f859ea4f613d5a976725362afc4a8483d767fb19a394b34d36565e2ddb264f3986b443b7827eb641051b54355e03061b86677a23fd8')

prepare () {
  cd '阿里巴巴集团字体'
  unzip -q -o -j 'AlibabaSans.zip' '*.otf' -d ../sans
  unzip -q -o -j '阿里巴巴普惠体.zip' '*.ttf' -d ../puhuiti
}

_install_license ()
{
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 '阿里巴巴集团字体/Law Policy for Alibaba Sans.pdf' \
    "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_alibaba-puhuiti() {
  install -dm755 "${pkgdir}/usr/share/fonts/alibaba/${pkgname}"
  install -Dm644 puhuiti/*.ttf "${pkgdir}/usr/share/fonts/alibaba/${pkgname}"
  _install_license
}

package_alibaba-sans() {
  pkgdesc="Alibaba Sans fonts"

  install -dm755 "${pkgdir}/usr/share/fonts/alibaba/${pkgname}"
  install -Dm644 sans/*.otf "${pkgdir}/usr/share/fonts/alibaba/${pkgname}"
  _install_license
}
