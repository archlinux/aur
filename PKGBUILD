# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wordpress-plugin-jetpack-lite
pkgver=3.0.3
pkgrel=1
pkgdesc="Prevent Jetpack modules from being loaded except for Stats and WP.me Shortlinks"
arch=('any')
url="https://github.com/pluginkollektiv/antispam-bee"
license=('GPL2')
depends=('wordpress' 'wordpress-plugin-jetpack')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.wordpress.org/plugin/jetpack-lite.${pkgver}.zip")
sha512sums=("2eabaf33140011e361d6219d08e1478c40726f088afb8cd1fb46c82ed832e4b202173d0366edf94ae3ee8a19c2cc3ad7b76616cb32b719fcf2274b321164aea5")

package() {
  install -d "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins"
  cp -ra "${srcdir}/jetpack-lite" "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins/"
  install -D "${srcdir}/jetpack-lite/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
