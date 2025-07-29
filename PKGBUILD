# Maintainer: taotieren <admin@taotieren.com>
# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_srcname=CJK-character-count

pkgname=cjk-character-count
pkgver=0.22
pkgrel=1
pkgdesc='Program that counts the amount of CJK characters based on Unicode ranges and Chinese encoding standards 字体汉字计数软件'
arch=('any')
url='https://github.com/NightFurySL2001/CJK-character-count'
license=('MIT')
depends=(
  'python'
  'python-fonttools'
  'python-pyglet'
)
optdepends=()
options=(!emptydirs !strip)
source=(
  "${_srcname}-v${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
  'CJK-character-count-en.desktop'
  'CJK-character-count-zhs.desktop'
  'CJK-character-count-zht.desktop'
)
sha256sums=('60e68234df2fb2ce7ef58e3620eaa8de6a0051494ecdac8a5b0f8365a1579638'
            '867a30183690e88ce0da13fd7c51abd7a436540fee24deefc68ac4dc8d19fae6'
            '34301f6b1b4812d97ba74f42382437a5794e4d1334ebc0f4dd514278b7fde5d0'
            'df70a15a2b93fb55521aa88f187eee20416d3923edaa6544502ce63891b17173')

package() {
  install -d "${pkgdir}/usr/share"
  cp -r "${_srcname}-${pkgver}" "${pkgdir}/usr/share/${pkgname}"
  install -d "${pkgdir}/usr/share/pixmaps"
  ln -s "/usr/share/${pkgname}/appicon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/share/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 CJK-character-count-en.desktop "${pkgdir}/usr/share/applications/CJK-character-count-en.desktop"
  install -Dm644 CJK-character-count-zhs.desktop "${pkgdir}/usr/share/applications/CJK-character-count-zhs.desktop"
  install -Dm644 CJK-character-count-zht.desktop "${pkgdir}/usr/share/applications/CJK-character-count-zht.desktop"
}
