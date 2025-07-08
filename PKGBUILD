# Maintainer: everyx <lunt.luo#gmail.com>

_pkgbase=ttf-zhuque-fangsong
pkgname="${_pkgbase}-bin"
pkgver=0.212
pkgrel=1

pkgdesc='朱雀仿宋/朱雀宋朝/Zhuque Fangsong: An open-source Fansong typeface project'
arch=('any')
url='https://github.com/TrionesType/zhuque'
license=('OFL')

source=("$pkgname-$pkgver.zip::${url}/releases/download/v${pkgver}/ZhuqueFangsong-v${pkgver}.zip")
sha256sums=('bb8b661a7643d2296a72d9d10530a00949419c4e527fb61783f73c2ba1a8c062')

provide=("${_pkgbase}")
conflicts=("${_pkgbase}")

makedepends=('unzip')

prepare() {
  unzip -o $pkgname-$pkgver.zip
}

package() {
  install -Dm755 ./*.ttf -t "$pkgdir/usr/share/fonts/${_pkgbase}"
}
