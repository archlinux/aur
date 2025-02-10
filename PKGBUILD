# Maintainer: J. Gerhards <g1.jasger@gmail.com>
# Author: J. Gerhards <g1.jasger@gmail.com>

pkgname=mpdris-bin
pkgver=1.1.1
pkgrel=1
pkgdesc='A MPD client implementing the dbus MPRIS standard written in rust -- binary version'
url='https://github.com/jasger9000/mpDris'
license=('MIT')
arch=('x86_64' 'i686' 'aarch64')
provides=('mpdris')
depends=('glibc' 'gcc-libs')
optdepends=('libsystemd: run mpdris as a service')
source_x86_64=("${pkgname}-v${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/mpdris_x86_64.tar.gz")
source_i686=("${pkgname}-v${pkgver}-i686.tar.gz::${url}/releases/download/v${pkgver}/mpdris_i686.tar.gz")
source_aarch64=("${pkgname}-v${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/mpdris_aarch64.tar.gz")
source=("mpdris.service")
sha256sums=('29fb19d923984a0d58edf647be99f916d82c37b04e58abb40f793517c8e0a903')
sha256sums_x86_64=('ef6ef8d2346d4c59f5c8b4325cfab778077898a6db9e00b60250972bfa9e494b')
sha256sums_i686=('70d7421f5477613598f15a7083e7b5b553c2b618561c90c77ba6f3e9338bd8c5')
sha256sums_aarch64=('7e4617379e8a4c818b61f237e6b618bf939857f49ecc90da482ac8b179758cf4')

package() {
  depends+=('dbus' 'mpd')

  install -Dm755 "$srcdir/mpdris" "$pkgdir/usr/bin/mpdris"
  install -Dm644 "$startdir/mpdris.service" "$pkgdir/usr/lib/systemd/user/mpdris.service"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
