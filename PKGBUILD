# Maintainer: everyx <lunt.luo#gmail.com>

_pkgbase=ttf-zhuque-fangsong
pkgname="${_pkgbase}-bin"
pkgver=0.210
pkgrel=1

pkgdesc='朱雀仿宋/朱雀宋朝/Zhuque Fangsong: An open-source Fansong typeface project'
arch=('any')
url='https://github.com/TrionesType/zhuque'
license=('OFL')

source=("$pkgname-$pkgver.zip::${url}/releases/download/v${pkgver}/ZhuqueFangsong-v${pkgver}.zip")
sha256sums=('17afd2e7a196ec4a3139f2fea0a174285aac148c76f5a9bc7eb7d72039a9b87a')

provide=("${_pkgbase}")
conflicts=("${_pkgbase}")

makedepends=('unzip')

prepare() {
  unzip -o $pkgname-$pkgver.zip
}

package() {
  install -Dm755 ./*.ttf -t "$pkgdir/usr/share/fonts/${_pkgbase}"
}
