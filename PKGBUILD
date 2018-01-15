pkgname=batman-adv-legacy-dkms
pkgver=20170609
pkgrel=1
pkgdesc='batman kernel module (legacy version based on compat 14, dkms package)'
arch=('any')
url='https://github.com/freifunk-gluon/batman-adv-legacy/'
license=('GPL')
source=(
	'batman-adv-legacy::git+https://github.com/freifunk-gluon/batman-adv-legacy.git#commit=a5bfc2661f589aec4eb63c64ed3e5a7c54a39541'
)
sha256sums=('SKIP')
depends=('dkms')

package() {
	install -dm755 "${pkgdir}/usr/src/${pkgbase}-${pkgver}/"

	cp -r "${srcdir}"/batman-adv-legacy/* "${pkgdir}/usr/src/${pkgbase}-${pkgver}/"

	sed -i "s/^PACKAGE_VERSION=.*$/PACKAGE_VERSION=${pkgver}/" "${pkgdir}/usr/src/${pkgbase}-${pkgver}/dkms.conf"
}
