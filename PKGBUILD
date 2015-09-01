# Maintainer: Vyacheslav Konovalov <vyachkonovalov@gmail.com>

pkgname=robomongo-bin
pkgver=0.8.5
pkgrel=2
pkgdesc='Shell-centric cross-platform MongoDB management tool'
arch=('x86_64')
url='http://robomongo.org/'
license=('GPLv3')
depends=('pcre' 'qt5-base' 'libxkbcommon-x11')
conflicts=('robomongo')
source=("http://robomongo.org/files/linux/robomongo-$pkgver-x86_64.deb")
md5sums=('9a311a211949557904402595c1939255')

package() {
  _origdir="${srcdir}/opt/robomongo"

  bsdtar xf data.tar.xz
  install -Dm0755 "${_origdir}/bin/robomongo" "$pkgdir/usr/bin/robomongo"
  install -Dm0644 "${_origdir}/share/applications/robomongo.desktop" "${pkgdir}/usr/share/applications/robomongo.desktop"
  install -Dm0644 "${_origdir}/share/icons/robomongo.png" "${pkgdir}/usr/share/pixmaps/robomongo.png"
  install -Dm0644 "${_origdir}/LICENSE" "${pkgdir}/usr/share/licenses/robomongo/LICENSE"
}
