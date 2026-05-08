# Maintainer: JP Roemer <jp+aur@roemer.im>

pkgname=cli53-bin
_pkgname="${pkgname%-bin}"
pkgver=0.9.0
pkgrel=2
pkgdesc="Command line tool for Amazon Route 53"
arch=('x86_64' 'aarch64' 'armv7h' 'armv6h')
url="https://github.com/barnybug/cli53"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${_pkgname}_${pkgver}_x86_64::${url}/releases/download/v$pkgver/${_pkgname}-linux-amd64")
source_aarch64=("${_pkgname}_${pkgver}_aarch64::${url}/releases/download/v$pkgver/${_pkgname}-linux-arm64")
source_armv7h=("${_pkgname}_${pkgver}_armv7h::${url}/releases/download/v$pkgver/${_pkgname}-linux-arm")
source_armv6h=("${_pkgname}_${pkgver}_armv6h::${url}/releases/download/v$pkgver/${_pkgname}-linux-arm")
sha256sums_x86_64=('cd95d87f633b85fe8facc7c3c3c8dcbe6d68283e936415c84461f9e7f613dee0')
sha256sums_aarch64=('e778db3590731fa0b4abd89ea42a2493af066c9b970b9a1f7aeba11aecc84637')
sha256sums_armv7h=('8b19ed6737125836396aad634e2ee4685226da09f2985f9e25880fea2ff37c0e')
sha256sums_armv6h=('8b19ed6737125836396aad634e2ee4685226da09f2985f9e25880fea2ff37c0e')

package() {
	install -D --mode 755 \
		"${srcdir}/${_pkgname}_${pkgver}_${CARCH}" \
		"${pkgdir}/usr/bin/${_pkgname}"
}
