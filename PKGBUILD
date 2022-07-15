#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=arch32-light
pkgver=2015
pkgrel=4
pkgdesc='Lightweight 32-bit chroot intended for 64-bit systems.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/arch32-light"
depends=(diffutils 'pacman-mirrorlist>=20100621' 'pacman>=3.4.0')
optdepends=('initscripts: for initscripts daemon support' 'xorg-xhost: for host xorg support')
conflicts=(arch32)
backup=(etc/arch32.conf etc/arch32d.conf)
source=(
  https://xyne.dev/projects/arch32-light/src/arch32-light-2015.tar.xz
  https://xyne.dev/projects/arch32-light/src/arch32-light-2015.tar.xz.sig
)
sha512sums=(
  bd1873763b4d74853f9d2a0167df1bf3a1376a1fcfd23b96c62eb3cb5f558c7dcf60a80e7bc58d04601b2e39099a8a01d4f475fce709b4fcf64acfdadfbb93ba
  956e8d8673b58f8d296a5e9e97c801a0a679d71da3157c5b31c35d8692360b9b722678b43cd210efd571425d514a18b5ac9782708c17b6e2807aa6ac304471b4
)
md5sums=(
  587c96663eefe801d9623c45ccf3557c
  7a69ae656105769d617d4a8a2e6b80bf
)
install=arch32-light.install
validpgpkeys=('D89FAAEB4CECAFD199A2F5E612C6F735F7A9A519')

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
