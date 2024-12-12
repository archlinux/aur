# Maintainer: everyx <lunt.luo#gmail.com>

_pkgbase=ttf-zhuque-fangsong
pkgname="${_pkgbase}-bin"
pkgver=0.200
pkgrel=1

pkgdesc='朱雀仿宋/朱雀宋朝/Zhuque Fangsong: An open-source Fansong typeface project'
arch=('any')
url='https://github.com/TrionesType/zhuque'
license=('OFL')

source=("$pkgname-$pkgver.zip::${url}/releases/download/v${pkgver}/ZhuqueFangsong-v${pkgver}.zip")
sha256sums=('b0fbffc4a8875c5ab41c07f9f2e83b0be7d58d18bdaf4f7f24d3d401682eca8c')

provide=("${_pkgbase}")
conflicts=("${_pkgbase}")

makedepends=('unzip')

prepare() {
  unzip -o $pkgname-$pkgver.zip
}

package() {
  install -Dm755 ./*.ttf -t "$pkgdir/usr/share/fonts/${_pkgbase}"
}
