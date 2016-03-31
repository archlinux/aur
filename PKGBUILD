# Maintainer: Konstantin Shalygin <k0ste@cn.ru>
# Contributor: Konstantin Shalygin <k0ste@cn.ru>

_sh='shrunked'
pkgname="thunderbird-${_sh}"
pkgver='4.3.1'
pkgrel='1'
pkgdesc="Shrunked makes a smaller copy of your photos for emailing or upload. When it detects a JPEG image (such as a photo), you'll be asked if you want to resize it."
arch=('any')
url="http://darktrojan.github.io/${_sh}"
license=('MPL')
depends=('thunderbird')
source=("${_sh}.xpi::https://addons.mozilla.org/thunderbird/downloads/latest/11005/addon-11005-latest.xpi?src=dp-btn-primary")
sha256sums=('e45f9394721f64abdffe5900060f4245520405998e00a998f9eeb4c7c8cb1a06')
noextract=(${source[@]%%::*})

package() {
  pushd "${srcdir}"
  install -Dm644 "${_sh}.xpi" "${pkgdir}/usr/lib/thunderbird/extensions/${_sh}@darktrojan.net.xpi"
  popd
}
