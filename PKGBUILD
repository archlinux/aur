# Maintainer: Alesh Slovak <aleshslovak@gmail.com>

pkgname=dtvp-utils
pkgver=1.0.0
pkgrel=1
pkgdesc='Utilities for Kingston DataTraveler Vault Privacy 3.0 encrypted drive'
arch=('x86_64')
url='https://www.kingston.com/en/usb/encrypted_security/dtvp30'
license=('unknown')
depends=('gcc-libs')

_src=`find /var/run/media -name 'linux64' | grep 'DTVP30' | head -1`

if [ -z "$_src" ]; then
	echo 'Please insert your Kingston DataTraveler Vault Privacy 3.0 device and try again'
	return 1
fi

cp "${_src}"/dtvp_* .
chmod u+w dtvp_*

source=(
	"dtvp_about"
	"dtvp_forgotpassword"
	"dtvp_initialize"
	"dtvp_login"
	"dtvp_logout"
)

md5sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
)

package() {
  install -Dm0755 "${srcdir}/dtvp_about" "${pkgdir}/usr/bin/dtvp_about"
  install -Dm0755 "${srcdir}/dtvp_forgotpassword" "${pkgdir}/usr/bin/dtvp_forgotpassword"
  install -Dm0755 "${srcdir}/dtvp_initialize" "${pkgdir}/usr/bin/dtvp_initialize"
  install -Dm0755 "${srcdir}/dtvp_login" "${pkgdir}/usr/bin/dtvp_login"
  install -Dm0755 "${srcdir}/dtvp_logout" "${pkgdir}/usr/bin/dtvp_logout"
}
