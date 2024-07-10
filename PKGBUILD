# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="sngrep"
pkgname="${_pkgname}-bin"
pkgver=1.8.2
pkgrel=1
pkgdesc="A tool for displaying SIP call message flows from a terminal"
arch=('x86_64' 'i686')
url="https://github.com/irontec/${_pkgname}"
_url="https://packages.irontec.com/binaries"
license=('GPL-3.0-or-later')
depends=('glibc' 'ncurses' 'libpcap' 'pcre' 'gnutls')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${url}/raw/v${pkgver}/"{README.md,LICENSE})
source_x86_64=("${_pkgsrc}-x86_64::${_url}/${_pkgname}-static-amd64-linux-gnu-${pkgver}")
source_i686=("${_pkgsrc}-i686::${_url}/${_pkgname}-static-i386-linux-gnu-${pkgver}")
sha256sums=('2b7814d3fca2e99e56c51b6ff2aa313ea6e9da6424804240aa8ad891fdfe0900'
            '8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903')
md5sums_x86_64=('354b230c6c426973cbd289c8bedfd914')
md5sums_i686=('8f460d1e77e3f8578ab4d529f0d0d873')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
