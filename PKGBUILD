# Maintainer: Marcel <aur-feedback [ät] marehr.dialup.fu-berlin.de>

_pkgname='sde'
pkgname='intel-sde'
_pkgver="8.59.0-2020-10-05-lin"
pkgver='8.59.0'
pkgrel='1'
pkgdesc='Intel Software Development Emulator'
arch=('x86_64')
url='https://software.intel.com/en-us/articles/intel-software-development-emulator/'
license=('custom')
depends=('lib32-glibc')
makedepends=()
optdepends=()

_source="${_pkgname}-external-${_pkgver}.tar.bz2"
source=(
  "https://software.intel.com/content/dam/develop/external/us/en/documents/downloads/${_source}")
sha256sums=(
  "889294794057184dc5945319ec5813306e69568cd1ad4c5567a99594cb2abf2f")

package() {
  cd "${srcdir}/${_pkgname}-external-${_pkgver}"

  mkdir -p "$pkgdir"/usr/{bin,share/$_pkgname/}

  cp -r * "$pkgdir"/usr/share/$_pkgname/
  ln -s /usr/share/$_pkgname/sde "$pkgdir"/usr/bin/sde
  ln -s /usr/share/$_pkgname/sde64 "$pkgdir"/usr/bin/sde64

  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
}
