# Maintainer: eltonff <eltonfabricio10@gmail.com>

pkgname=mediaharbor-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="MediaHarbor is your all-in-one media downloader."
arch=('x86_64')
url="https://github.com/MediaHarbor/mediaharbor"
license=('GPL3')

depends=(
  'gtk3'
  'nss'
  'alsa-lib'
  'libxtst'
  'libnotify'
  'libxss'
  'libsecret'
  'python-isodate'
  'streamrip'
)
optdepends=('ffmpeg')
provides=("mediaharbor=${pkgver}")
conflicts=('mediaharbor')

_pkgname="MediaHarbor"
source=("${_pkgname}-${pkgver}.deb::https://github.com/MediaHarbor/mediaharbor/releases/download/v${pkgver}/${_pkgname}-${pkgver}.deb")

sha256sums=('470b5ba9025c6b04da2b6504c8b162c880ba3b05f55a9d2f7657e4d8479c13aa')

package() {
  cd "$srcdir"
  ar x "${_pkgname}-${pkgver}.deb"
  bsdtar -xf data.tar.* -C "$pkgdir"
}
