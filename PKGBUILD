# Maintainer: nl6720 <nl6720@archlinux.org>
# Contributor: c4tz
pkgname=kodi-addon-script-module-inputstreamhelper
pkgver=0.8.5
pkgrel=1
pkgdesc='A simple Kodi module that makes life easier for add-on developers relying on InputStream based add-ons and DRM playback'
_gitname=script.module.inputstreamhelper
arch=('any')
url="https://github.com/emilsvennesson/${_gitname}"
license=('MIT')
makedepends=('git')
depends=('kodi-addon-inputstream-adaptive')
source=("https://github.com/emilsvennesson/${_gitname}/releases/download/v${pkgver}/${_gitname}-${pkgver}.zip")
sha512sums=('04efa4ec2d1e8438f06a02fb034b0dac7de3dfd7971c453899aedc81719604f48457e501548952112595fef09d622e1062bdc1d432f84b0b8caac31b149c95bb')

package() {
	install -d "${pkgdir}/usr/share/kodi/addons"
	cp -r "${_gitname}" "${pkgdir}/usr/share/kodi/addons"
	install -Dm644 "${_gitname}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
