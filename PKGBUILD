# Maintainer: agony <27015 at riseup dot net>

pkgname=rutorrent-theme-dracula
pkgver=0.4.1
pkgrel=1
pkgdesc='Dracula dark theme for ruTorrent'
arch=('any')
url='https://github.com/dracula/rutorrent'
license=('MIT')
depends=('rutorrent')
checkdepends=('nodejs')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0efc5ed6c13f9528f5151b464b2dc706752cf5291ea950431dac194b2bac5e63')

check() {
  cd "rutorrent-${pkgver}"
  node --test --test-reporter=dot
}

package() {
  cd "rutorrent-${pkgver}"
  install -d "${pkgdir}/usr/share/webapps/rutorrent/plugins/theme/themes"
  cp -r Dracula "${pkgdir}/usr/share/webapps/rutorrent/plugins/theme/themes/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
