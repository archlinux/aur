# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wordpress-theme-geist
pkgver=2.0.0
pkgrel=1
pkgdesc="Personal blogging theme for WordPress. Port of Casper 2.0 theme for Ghost"
arch=('any')
url="https://chrisyee.ca/geist/"
license=('GPL2')
depends=('wordpress')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/christophery/geist/archive/${pkgver}.tar.gz")
sha512sums=('7d1116614dca098eb1474fbdfbd4de70176e71a891f3cdfd2441c93e5eb0aa53f6f5e4ce75cc02ef488d61cf1eafa70e69f57952e18e919a64f6564a54733136')

package() {
  install -d "${pkgdir}/usr/share/webapps/wordpress/wp-content/themes"
  cp -ra "${srcdir}/geist-${pkgver}" "${pkgdir}/usr/share/webapps/wordpress/wp-content/themes/geist"
  install -D "${srcdir}/geist-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
