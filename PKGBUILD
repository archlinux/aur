# Maintainer: Marcel <aur-feedback [ät] marehr.dialup.fu-berlin.de>

_pkgname='sde'
pkgname='intel-sde'
_pkgver="8.50.0-2020-03-26-lin"
pkgver='8.50.0'
pkgrel='3'
pkgdesc='Intel Software Development Emulator'
arch=('x86_64')
url='https://software.intel.com/en-us/articles/intel-software-development-emulator/'
license=('custom')
depends=('lib32-glibc')
makedepends=()
optdepends=()

_source="${_pkgname}-external-${_pkgver}.tar.bz2"
source=(
  "http://software.intel.com/content/dam/develop/external/us/en/protected/${_source}")
sha256sums=(
  "ecabeb26c3b35cfe72b6ba017b1ba1849516b4b077c2b59e730a0fdf00324be4")

package() {
  cd "${srcdir}/${_pkgname}-external-${_pkgver}"

  mkdir -p "$pkgdir"/usr/{bin,share/$_pkgname/}

  cp -r * "$pkgdir"/usr/share/$_pkgname/
  ln -s /usr/share/$_pkgname/sde "$pkgdir"/usr/bin/sde
  ln -s /usr/share/$_pkgname/sde64 "$pkgdir"/usr/bin/sde64

  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
}
