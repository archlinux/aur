# Maintainer: Konstantin Shalygin (k0ste@opentech.ru)

_bcc='usebccinstead'
_bcc2='use-bcc-instead'
pkgname=thunderbird-${_bcc}
pkgver='3.4'
pkgrel='2'
pkgdesc='Before the sending occurs it looks for recipients addressed using either TO or CC. When found, it will take action based upon the user-specified options that have been set'
arch=('any')
url=https://addons.mozilla.org/en-US/thunderbird/addon/${_bcc2}
license=('MPL')
depends=('thunderbird')
source=("${_bcc}.xpi::https://addons.mozilla.org/thunderbird/downloads/file/288906/${_bcc2}-${pkgver}-tb.xpi")
sha256sums=("49bc1530ec9289c9495dca7b60b2d58350ab6de8cfd28f78b8739de5547e9171")
noextract=(${source[@]%%::*})

package() {
  pushd "$srcdir"
  install -Dm644 "${_bcc}.xpi" "$pkgdir/usr/lib/thunderbird/extensions/{cc138c46-ac77-4397-afc0-6cb6a13b7242}.xpi"
  popd
}
