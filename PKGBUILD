# Maintainer: everyx <lunt.luo#gmail.com>

_pkgbase=ttf-zhuque-fangsong
pkgname="${_pkgbase}-bin"
pkgver=0.108
pkgrel=1

pkgdesc='朱雀仿宋/朱雀宋朝/Zhuque Fangsong: An open-source Fansong typeface project'
arch=('any')
url='https://github.com/TrionesType/zhuque'
license=('OFL')

source=("$pkgname-$pkgver.zip::${url}/releases/download/v${pkgver}/ZhuqueFangsong-v${pkgver}.zip")
sha256sums=('ff7bab9764b88d58f0f4b18fe197fd1b3eac3a67c10030a240556da8dca0c60a')

provide=("${_pkgbase}")
conflicts=("${_pkgbase}")

makedepends=('unzip')

prepare() {
  unzip -o $pkgname-$pkgver.zip
}

package() {
  install -Dm755 ./*.ttf -t "$pkgdir/usr/share/fonts/${_pkgbase}"
}
