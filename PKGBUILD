# Maintainer: Konstantin Shalygin <k0ste@cn.ru>
# Contributor: Konstantin Shalygin <k0ste@cn.ru>

_sh='shrunked'
pkgname="thunderbird-${_sh}"
pkgver='4.3.2'
pkgrel='1'
pkgdesc="Shrunked makes a smaller copy of your photos for emailing or upload. When it detects a JPEG image (such as a photo), you'll be asked if you want to resize it."
arch=('any')
url="https://darktrojan.github.io/${_sh}"
license=('MPL')
depends=('thunderbird')
source=("${_sh}.xpi::https://addons.mozilla.org/thunderbird/downloads/latest/11005/addon-11005-latest.xpi?src=dp-btn-primary")
sha256sums=('77ddd3f39b410c44b347a9083afc3b73f10d6841dd0474d676ae3066514b08ac')
noextract=(${source[@]%%::*})

package() {
  cd "${srcdir}"
  install -Dm644 "${_sh}.xpi" "${pkgdir}/usr/lib/thunderbird/extensions/${_sh}@darktrojan.net.xpi"
}
