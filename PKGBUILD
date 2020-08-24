# Maintainer: Joshua Rubin <me at jawa dot dev>

pkgname=linhpsdr-git
_pkgname=linhpsdr
pkgver=r218.4284530
pkgrel=1
pkgdesc='Linux HPSDR'
arch=('x86_64')
url='https://github.com/g0orx/linhpsdr'
license=('GPL2')
depends=('wdsp' 'unixcw' 'fftw' 'pulseaudio' 'libsoundio' 'gtk3' 'soapysdr')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/g0orx/${_pkgname}")
md5sums=('SKIP')
sha1sums=('SKIP')
sha256sums=('SKIP')
sha384sums=('SKIP')
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  make
}

package() {
  cd "$_pkgname"
  install -D "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -D hpsdr.png -m 0644 "${pkgdir}/usr/share/linhpsdr/hpsdr.png"
  install -D hpsdr_icon.png -m 0644 "${pkgdir}/usr/share/linhpsdr/hpsdr_icon.png"
  install -D hpsdr_small.png -m 0644 "${pkgdir}/usr/share/linhpsdr/hpsdr_small.png"
  install -D linhpsdr.desktop -m 0644 "${pkgdir}/usr/share/applications/linhpsdr.desktop"
}
