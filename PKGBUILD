pkgname='reapack'
pkgver=v1.2.4.1
pkgrel=1
pkgdesc="Package manager for the Reaper DAW"
url="https://reapack.com"
arch=('any')
license=('GPL')
provides=('reapack')
install="${pkgname}.install"
source=()
sha256sums=()

case "$CARCH" in
	arm64) _pkgarch="aarch64"
		sha256sums+=('4b68ee070ad27c692238ac114144a9bccdf073cd38c32b8c022c8f8d1e38cbbc')
		;;
	armv*) _pkgarch="armv71"
		sha256sums+=('f56201743080e1ca18858ff20c544b546d3aa5a63d3ae68463040ccc03f8b358')
		;;
	i686) _pkgarch="i686"
		sha256sums+=('eb515ad6e4be9a73d7bd8acb4214b8e7b6e5015782751a1a8f3cc291daaa6497')
		;;
	x86_64) _pkgarch="x86_64"
		sha256sums+=('90b5de255cae61abac213369620a4adeef32e0e94d3476eeddde6f54c8a64c9c')
		;;
esac

source+=("https://github.com/cfillion/${pkgname}/releases/download/${pkgver}/reaper_${pkgname}-${_pkgarch}.so")

package() {
    REAPACK="reaper_${pkgname}-${_pkgarch}.so"
    install -Dm755 "${REAPACK}" "${pkgdir}/opt/REAPER/UserPlugins/${REAPACK}"
}

# vim:set ts=2 sw=2 et:
