# Maintainer: Storm Dragon <stormdragon2976@gmail.com>
_pkgname=automount-usb
pkgname=automount-usb-git
pkgver=1
pkgrel=1
pkgdesc="Automount USB drives with systemd"
arch=('any')
url="https://github.com/six-k/automount-usb"
license=('unlicense')
depends=('bash')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+${url}.git")
md5sums=("SKIP")

pkgver()
{
  cd "$_pkgname"
  git shortlog | head -n 1 | tr -Cd "[:digit:]"
}
 
package()
 {
  cd "$_pkgname"
  install -d "$pkgdir/usr/local/bin"
 install -d "$pkgdir/etc/systemd/system"
 install -d "$pkgdir/etc/udev/rules.d"
  install -m755 "usb-mount.sh" "$pkgdir/usr/local/bin"
  install -m644 "usb-mount@.service" "$pkgdir//etc/systemd/system/"
  install -m644 "99-local.rules.usb-mount" "$pkgdir/etc/udev/rules.d/99-local.rules"
  }

# vim:set ts=2 sw=2 et:
