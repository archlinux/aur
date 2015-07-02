# Maintainer: Konstantin Shalygin (k0ste@opentech.ru)

_sh='shrunked'
pkgname=thunderbird-${_sh}
pkgver='4.1'
pkgrel='1'
pkgdesc="Shrunked makes a smaller copy of your photos for emailing or upload. When it detects a JPEG image (such as a photo), you'll be asked if you want to resize it."
arch=('any')
url=https://addons.mozilla.org/en-US/thunderbird/addon/${_sh}-image-resizer
license=('MPL')
depends=('thunderbird')
source=("${_sh}.xpi::https://addons.mozilla.org/thunderbird/downloads/file/319282/${_sh}_image_resizer-4.1-sm+tb+fx.xpi")
sha256sums=("efb72c4ca3f11f5f6ad2f7a47ddc02395ef7cfaebc5bde1c53895c97ed9f899f")
noextract=(${source[@]%%::*})

package() {
  pushd "$srcdir"
  install -Dm644 "${_sh}.xpi" "$pkgdir/usr/lib/thunderbird/extensions/${_sh}.xpi"
  popd
}
