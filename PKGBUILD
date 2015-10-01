# Maintainer: Konstantin Shalygin (k0ste@opentech.ru)

_bcc='usebccinstead'
_bcc2='use-bcc-instead'
pkgname=thunderbird-${_bcc}
pkgver='3.4.1'
pkgrel='0'
pkgdesc='Before the sending occurs it looks for recipients addressed using either TO or CC. When found, it will take action based upon the user-specified options that have been set'
arch=('any')
url=https://addons.mozilla.org/en-US/thunderbird/addon/${_bcc2}
license=('MPL')
depends=('thunderbird')
source=("${_bcc}.xpi::https://addons.mozilla.org/thunderbird/downloads/latest/318229/addon-318229-latest.xpi")
sha256sums=('1fa3f59b822ef0f91af082efcd1ffc26a8b17fa5f85b076ce70154f2ce7c319d')
noextract=(${source[@]%%::*})

package() {
  pushd "$srcdir"
  install -Dm644 "${_bcc}.xpi" "$pkgdir/usr/lib/thunderbird/extensions/{cc138c46-ac77-4397-afc0-6cb6a13b7242}.xpi"
  popd
}
