# Maintainer: Anthony Ettinger <anthony@chovy.com>
pkgname=(webull-desktop)
pkgver=4.2.9
pkgrel=1
pkgdesc=""
arch=('x86_64')
url="https://webull.com"
license=('custom')
depends=(hicolor-icon-theme)
source_x86_64=("https://pub.webull.com/global/desktop/Webull%20Desktop%204.2.9.deb")
sha512sums_x86_64=('c3e80bff61561fff576b2cbeb66a8678089283eb712e94b76880de8ecb6005a66a1b7121d6e08b53ef021cb1cb8f92fd058fff794d2f1adf128b40e882d410d1')

package(){
  bsdtar --no-same-owner -xf  data.tar.xz -C "${pkgdir}"
  mv "${pkgdir}"/usr/local/ "${pkgdir}"/opt
  install -Dm644 "${pkgdir}"/opt/WebullDesktop/LICENSE.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE.txt
  install -dm755 "${pkgdir}"/usr/bin
  ln -s /opt/WebullDesktop/WebullDesktop "${pkgdir}"/usr/bin
  sed -i 's|Exec=/usr/local/WebullDesktop/WebullDesktop|Exec=WebullDesktop|' "${pkgdir}"/usr/share/applications/WebullDesktop.desktop
}
