# Maintainer: Arya <mirakitty277@gmail.com>
pkgname=3utools-desktop-bin
pkgver=3.01.005
pkgrel=1
pkgdesc="Apple Device Management Tool, converts 3utools.deb to a arch package"
arch=('x86_64') # Only 64-bit support
depends=('libx11' 'libxcb' 'libxkbcommon-x11' 'fontconfig' 'freetype2')
provides=('3utools')
conflicts=('3utools-bin')
url="https://www.3u.com/"
license=('custom')
options=('!strip' '!emptydirs')
source_x86_64=("https://dl.3u.com/update/v900/dl/linux/com.3u.3utools_3.01.005_amd64.deb")
sha512sums_x86_64=('2e36616cdf27c44977ed92e97b28e6fa0a882163be74bdaca76c76129a774e083a5e90d0fc82fe44bc6c85a21c783f840597285da97e39627ae9356ab6296cf9')


package() {
	# 1. Extract the data into the package directory
	bsdtar -xf data.tar.xz -C "${pkgdir}"

	# 2. path to the license file by adding "${pkgdir}/"
	install -D -m644 "${pkgdir}/opt/apps/com.3u.3utools/doc/libpulse0/copyright" \
	                 "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
