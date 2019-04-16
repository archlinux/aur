# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

_sh='shrunked'
pkgname="thunderbird-${_sh}"
pkgver='4.5.2'
pkgrel='1'
pkgdesc="Shrunked makes a smaller copy of your photos for emailing or upload. When it detects a JPEG image (such as a photo), you'll be asked if you want to resize it."
arch=('any')
url="https://darktrojan.github.io/${_sh}"
license=('MPL')
depends=('thunderbird')
source=("${_sh}.xpi::https://addons.mozilla.org/thunderbird/downloads/latest/11005/addon-11005-latest.xpi?src=dp-btn-primary")
sha256sums=('5cc145fe95771eb88d15c10340ba76562b5462dd36059d17dbc0b7d4ed72a196')
noextract=(${source[@]%%::*})

package() {
  cd "${srcdir}"
  install -Dm0644 "${_sh}.xpi" "${pkgdir}/usr/lib/thunderbird/extensions/${_sh}@darktrojan.net.xpi"
}
