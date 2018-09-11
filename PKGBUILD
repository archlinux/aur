# Maintainer: Maxim Devaev <mdevaev@gmail.com>
# Contributor: Maxim Devaev <mdevaev@gmail.com>


_pkgbase="tc358743"

pkgname="tc358743-dkms"
pkgver="0.1"
pkgrel="1"
pkgdesc="TC358743 driver (DKMS)"
license=("GPL")
arch=("any")
url="https://kernel.org"
depends=("dkms")


source=("Makefile" "dkms.conf")
md5sums=("d68fd9e539ac9418ffb134cf9dd041c4"
         "b1d9ba9a3f66e7c3936bc349deddadf8")


package() {
	# Copy dkms.conf
	install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
	install -Dm644 Makefile "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/Makefile

	# Set name and version
	sed -e "s/@_PKGBASE@/${_pkgbase}/" \
		-e "s/@PKGVER@/${pkgver}/" \
		-i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
