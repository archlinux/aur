# Maintainer: Ming Di Leom

_pkgname=freetube
pkgname=${_pkgname}-nightly
pkgver=0.18.0_nightly_3235
pkgrel=1
pkgdesc="A private YouTube client (nightly build)"
arch=('x86_64')
url="https://github.com/FreeTubeApp/FreeTube#readme"
license=('AGPL-3.0-or-later')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=(
  'c-ares'
  'ffmpeg'
  'gtk3'
  'http-parser'
  'libevent'
  'libvpx'
  'libxslt'
  'libxss'
  'minizip'
  'nss'
  're2'
  'snappy'
  'libnotify'
  'libappindicator-gtk3'
  'ttf-liberation'
)
install=$pkgname.install
source=("https://github.com/curbengh/${pkgname}/releases/latest/download/${_pkgname}.pacman.tar.xz")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/"
  grep -oP '(?<=pkgver = )[\S]+(?=-\d+)' '.PKGINFO'
}

package() {
  install -d "$pkgdir/opt/FreeTube"
  cp -r  "${srcdir}/opt/" "${pkgdir}/"
  cp -r  "${srcdir}/usr/" "${pkgdir}/"
}
