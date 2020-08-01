# Maintainer: Marcel <aur-feedback [ät] marehr.dialup.fu-berlin.de>

_pkgname='sde'
pkgname='intel-sde'
_pkgver="8.56.0-2020-07-05-lin"
pkgver='8.56.0'
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
  "https://software.intel.com/content/dam/develop/external/us/en/documents/${_source}")
sha256sums=(
  "5808efc9629b08f7a62bf77f81550034481ae64aeb27d5e7a48cfee0907ac49d")

package() {
  cd "${srcdir}/${_pkgname}-external-${_pkgver}"

  mkdir -p "$pkgdir"/usr/{bin,share/$_pkgname/}

  cp -r * "$pkgdir"/usr/share/$_pkgname/
  ln -s /usr/share/$_pkgname/sde "$pkgdir"/usr/bin/sde
  ln -s /usr/share/$_pkgname/sde64 "$pkgdir"/usr/bin/sde64

  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
}
