# Maintainer: MidAutumnMoon <mid.autumn0moon@gmail.com>

pkgname=agate-bin
pkgver=2.4.1
pkgrel=1
pkgdesc="Very simple server for the Gemini hypertext protocol."
arch=( 'x86_64' )
url="https://github.com/mbrubeck/agate"
license=( 'APACHE' 'MIT' )

source=(
  https://github.com/mbrubeck/agate/releases/download/v${pkgver}/agate.x86_64-unknown-linux-gnu.gz
  agate@.service
  agate.conf
  agate.sysusers
)
md5sums=( 'e9934f6bed2b21c3f760fa1563dea7f1'
          'e27d6af60a904897ab80a766f5eae8dc'
          '4a00996b03caf45dc30b969b10854c3a'
          'f3aff0c50b6af48da0bbb37d2c8a1b07' )
backup=( 'etc/agate.conf' )

conflicts=( 'agate' )
provides=( 'agate' )

package() {
  install -Dm644 "${srcdir}/agate.conf"     "${pkgdir}/etc/agate/agate.conf"
  install -Dm644 "${srcdir}/agate@.service" "${pkgdir}/usr/lib/systemd/system/agate@.service"
  install -Dm644 "${srcdir}/agate.sysusers" "${pkgdir}/usr/lib/sysusers.d/agate.conf"

  install -Dm755 "${srcdir}/agate.x86_64-unknown-linux-gnu" "${pkgdir}/usr/bin/agate"
}
