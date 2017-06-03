# Maintainer: Azer Koculu <azer@roadbeats.com

pkgname=mmake-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Modern Make"
arch=('x86_64' 'i386' 'arm')
url="https://github.com/tj/mmake"
license=('Apache')
provides=('mmake')
conflicts=('mmake')

source_x86_64=("https://github.com/tj/mmake/releases/download/v1.2.0/mmake_linux_amd64")
source_i686=("https://github.com/tj/mmake/releases/download/v1.2.0/mmake_linux_386")
source_arm=("https://github.com/tj/mmake/releases/download/v1.2.0/mmake_linux_arm")
sha256sums_x86_64=('9ff59e186f3fc1d0d97c096202b9c2d5e9a442e15aa3892a1175324a72fcf695')
sha256sums_i686=('c3d9a903f7493e92837444078235b87ffeb857c48516c2f0da8691251d8d41e9')
sha256sums_arm=('271d1aaf213abb9a722a6405bf20b65c7cb29adfe04ca9c87445ec015a48bcf9')

case "$CARCH" in
  arm*) _pkgarch="arm"
	;;
  i686) _pkgarch="386"
	;;
  x86_64) _pkgarch="amd64"
	;;
esac

package() {
  install -Dm755 "${srcdir}/${pkgname/-bin}_linux_${_pkgarch}" "${pkgdir}/usr/bin/${pkgname/-bin}"
}
