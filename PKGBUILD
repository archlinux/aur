# Maintainer: everyx <lunt.luo#gmail.com>

_pkgbase=ttf-zhuque-fangsong
pkgname="${_pkgbase}-bin"
pkgver=0.107
pkgrel=1

pkgdesc='朱雀仿宋/朱雀宋朝/Zhuque Fangsong: An open-source Fansong typeface project'
arch=('any')
url='https://github.com/TrionesType/zhuque'
license=('OFL')

source=("$pkgname-$pkgver.zip::${url}/releases/download/v${pkgver}/ZhuqueFangsong-v${pkgver}.zip")
sha256sums=('cc3cef7c1c6431713c80f09937c253dbdd872c938bc074a7f63678baadce24a9')

provide=("${_pkgbase}")
conflicts=("${_pkgbase}")

makedepends=('unzip')

prepare() {
  unzip -o $pkgname-$pkgver.zip
}

package() {
  install -Dm755 ./*.ttf -t "$pkgdir/usr/share/fonts/${_pkgbase}"
}
