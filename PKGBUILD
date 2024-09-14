# Maintainer: xrz <aur@xrzyun.eu.org>
pkgname=cloudflarewarpspeedtest-bin
_appname=CloudflareWarpSpeedTest
pkgver=v1.5.4
pkgrel=1
pkgdesc="Test the latency and speed of all Cloudflare Warp IPs to obtain the lowest latency and port. ⭐WARP IP 优选工具"
arch=(
	'aarch64'
	'x86_64'
)
url="https://github.com/peanut996/CloudflareWarpSpeedTest"
license=("GPL-3.0-only")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=()
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/${pkgver}/${_appname}-${pkgver}-linux-arm64.tar.gz")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/${pkgver}/${_appname}-${pkgver}-linux-amd64.tar.gz")
md5sums_aarch64=('9fe20734e4711eeca270189f4aea5ff0')
md5sums_x86_64=('b4716ce848ec2312ce45d4e57e3e7458')
package() {
	mkdir -p "$pkgdir/usr/bin/"
	install -Dm755 "${srcdir}/${_appname}" "${pkgdir}/usr/bin/${_appname}"
}
