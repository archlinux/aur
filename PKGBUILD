
pkgname=kaku-bin
pkgver=1.6.1
pkgrel=1
pkgdesc="The next generation music client"
# TODO: add 32 bit
arch=('x86_64')
url="http://kaku.rocks"
repo="git://github.com/EragonJ/Kaku.git"
license=('MIT')
options=(!strip)
depends=('gconf' 'gtk2' 'libnotify' 'nss' 'alsa-lib' 'libxtst')
optdepends=('gvfs' 'python2' 'xdg-utils' 'desktop-file-utils')
conflicts=('kaku')

md5sums=('2c8133c984200218ec127c76e65eaee0'
         '4da31bb76a5352d2310a332d7972be4a'
         'abbb6affbdd10243d96892edc5dd68ac')
source=(
  "Kaku-linux64-v${pkgver}.zip::https://github.com/EragonJ/Kaku/releases/download/${pkgver}/Kaku-linux64.zip"
  "kaku.png::https://camo.githubusercontent.com/0b9900f6f5800a2121741e6adf860a048220cef0/687474703a2f2f692e696d6775722e636f6d2f63334b4b5139742e706e67"
  "kaku.desktop")

package() {
  mkdir -p "${pkgdir}/usr/share/kaku"
  mkdir -p "${pkgdir}/usr/bin"
  cp -R "${srcdir}/Kaku-linux64"/* "${pkgdir}/usr/share/kaku"
  ln -s "/usr/share/kaku/Kaku" "${pkgdir}/usr/bin/kaku"
  install -Dm644 "${srcdir}/kaku.png" "${pkgdir}/usr/share/icons/kaku.png"
  install -Dm644 "${srcdir}/kaku.desktop" "${pkgdir}/usr/share/applications/kaku.desktop"
}
