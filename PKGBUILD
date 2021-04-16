# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: RiotKit <youremail@domain.com>

pkgname=gpbkdf2-bin
_pkgname=gpbkdf2
pkgver=1.0
pkgrel=1
pkgdesc="PBKDF2 key encoder for use in shell. Single, tiny binary. Written in Go"
arch=('x86_64' 'armv7h')
url="https://github.com/riotkit-org/gpbkdf2"
license=('LGPL3')
source_x86_64=("gpbkdf2::${url}/releases/download/v${pkgver}/gpbkdf2")
source_armv7h=("gpbkdf2_armv7::${url}/releases/download/v${pkgver}/gpbkdf2_armv7")
noextract=(${source[@]%%::*})
sha256sums_x86_64=('97f8acfbbf3ab465df4faf3c752602aa5e91f1ae0040032bf9ab106dbc88398d')
sha256sums_armv7h=('81815cffc72e5c3756c1679d986aff5f2c4f1eea8170787b89759ed5b6e5e56e')

package() {
  if [[ $CARCH == 'x86_64' ]]; then
    install -Dm755 "$srcdir/gpbkdf2" "$pkgdir/usr/bin/$_pkgname"
  elif [[ $CARCH == 'armv7h' ]]; then
    install -Dm755 "$srcdir/gpbkdf2_armv7" "$pkgdir/usr/bin/$_pkgname"
  fi
}