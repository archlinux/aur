#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=arch32-light
pkgver=2015
pkgrel=1
pkgdesc='Lightweight 32-bit chroot intended for 64-bit systems.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/arch32-light"
depends=(diffutils 'pacman>=3.4.0' 'pacman-mirrorlist>=20100621')
optdepends=('initscripts: for initscripts daemon support' 'xorg-xhost: for host xorg support')
conflicts=(arch32)
backup=(etc/arch32.conf etc/arch32d.conf)
source=(
  http://xyne.archlinux.ca/projects/arch32-light/src/arch32-light-2015.tar.xz
  http://xyne.archlinux.ca/projects/arch32-light/src/arch32-light-2015.tar.xz.sig
)
sha512sums=(
  bd1873763b4d74853f9d2a0167df1bf3a1376a1fcfd23b96c62eb3cb5f558c7dcf60a80e7bc58d04601b2e39099a8a01d4f475fce709b4fcf64acfdadfbb93ba
  a65e20d5a8240174a44fc82ac554a6b6a2404a3c5417fbfa0dcd45f2ad5e3c221f34fb237882fbfc7e0915f53358ee103dd9c61812abf60290b85c9d439ae18f
)
md5sums=(
  587c96663eefe801d9623c45ccf3557c
  d1375746b73425a011a46530b8493791
)
install=arch32-light.install
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd -- "${srcdir}/${pkgname}-${pkgver}"
  install -Dm644 arch32.conf "${pkgdir}/etc/arch32.conf"
  install -Dm644 arch32d.conf "${pkgdir}/etc/arch32d.conf"

  install -Dm644 arch32.service "$pkgdir/usr/lib/systemd/system/arch32.service"

  install -Dm755 arch32initialize "${pkgdir}/usr/bin/arch32initialize"
  install -Dm755 arch32m "${pkgdir}/usr/bin/arch32m"
  install -Dm755 arch32 "${pkgdir}/usr/bin/arch32"

  install -Dm755 pacman32 "${pkgdir}/usr/bin/pacman32"

  install -Dm644 "man/${pkgname}.1.gz" "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
}


# vim: set ts=2 sw=2 et:
