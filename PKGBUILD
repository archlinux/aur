# Maintainer: MidAutumnMoon <mid.autumn0moon@gmail.com>

pkgname=agate-bin
pkgver=2.3.0
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
md5sums=( 'ffddb0ff70cef9258c12fff043e71558'
          '839a3f9c3dcd263d0b672e7c4b7f0576'
          'f20ec61e69f2a2432c742275542c03a9'
          'f3aff0c50b6af48da0bbb37d2c8a1b07' )
backup=( 'etc/agate.conf' )

conflicts=( 'agate' )

package() {
  install -Dm644 "${srcdir}/agate.conf"     "${pkgdir}/etc/agate.conf"
  install -Dm644 "${srcdir}/agate@.service"  "${pkgdir}/usr/lib/systemd/system/agate@.service"
  install -Dm644 "${srcdir}/agate.sysusers" "${pkgdir}/usr/lib/sysusers.d/agate.conf"

  install -Dm755 "${srcdir}/agate.x86_64-unknown-linux-gnu" "${pkgdir}/usr/bin/agate"
}
