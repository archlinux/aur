# Maintainer: Nick Hu <me@nickhu.co.uk>

pkgname=low_battery_suspend
pkgver=1.1
pkgrel=1
pkgdesc="Simple bash script to suspend the system based on the output of acpi."
arch=('i686' 'x86_64')
url="https://github.com/NickHu/low_battery_suspend"
license=('MIT')
depends=('bash' 'acpi')
source=("https://github.com/NickHu/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('ee046934ade58964ed215eafef33b49b')

package()
{
  install -d ${pkgdir}/usr/bin
  install -d ${pkgdir}/usr/lib/systemd/system
  install -m 755 ${srcdir}/${pkgname}-${pkgver}/low_battery_suspend ${pkgdir}/usr/bin/low_battery_suspend
  install -m 644 -t ${pkgdir}/usr/lib/systemd/system ${srcdir}/${pkgname}-${pkgver}/systemd/*
}
