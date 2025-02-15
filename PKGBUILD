# Maintainer: J. Gerhards <g1.jasger@gmail.com>
# Author: J. Gerhards <g1.jasger@gmail.com>

pkgname=mpdris-bin
_pkgname=mpdris
pkgver=1.2.0
pkgrel=2
pkgdesc='A MPD client implementing the dbus MPRIS standard written in rust -- binary version'
url='https://github.com/jasger9000/mpDris'
license=('MIT')
arch=('x86_64' 'i686' 'aarch64')
provides=('mpdris')
conflicts=('mpdris' 'mpdris-git')
depends=('glibc' 'gcc-libs')
optdepends=('libsystemd: run mpdris as a service')
source_x86_64=("${_pkgname}-v${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/mpdris_x86_64.tar.gz")
source_i686=("${_pkgname}-v${pkgver}-i686.tar.gz::${url}/releases/download/v${pkgver}/mpdris_i686.tar.gz")
source_aarch64=("${_pkgname}-v${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/mpdris_aarch64.tar.gz")
source=("mpdris.service")
sha256sums=('29fb19d923984a0d58edf647be99f916d82c37b04e58abb40f793517c8e0a903')
sha256sums_x86_64=('afbad270ff6bdcf6cba9fff80136108744f19b061dc522a0194862ed7631945b')
sha256sums_i686=('41d79ec0957f4fbfe173881e4135d7780d63bd00bd8a8d500bccd231db7e0e9c')
sha256sums_aarch64=('7085961148d683985397a3e00af097ba4e4df88c3b49473c02339ab10c06933a')

package() {
  depends+=('dbus' 'mpd')

  install -Dm755 "$srcdir/mpdris" "$pkgdir/usr/bin/mpdris"
  install -Dm644 "$startdir/mpdris.service" "$pkgdir/usr/lib/systemd/user/mpdris.service"
  install -Dm644 "$srcdir/sample.mpDris.conf" "$pkgdir/usr/share/doc/${_pkgname}/sample.mpDris.conf"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
