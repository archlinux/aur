# Maintainer: dreieck
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Link Dupont <link@subpop.net>


pkgname=dbus-openrc-initscript
pkgver=1.10.10
pkgrel=3
pkgdesc="OpenRC init script for dbus.Freedesktop.org message bus system"
url="https://raw.githubusercontent.com/gentoo/gentoo/master/sys-apps/dbus/files/dbus.initd-r1"
arch=("any")
license=("GPL2")
provides=("dbus-openrc=${pkgver}")
replaces=("dbus-openrc<10.10.10")
depends=("dbus>=1.10")
makedepends=()
conflicts=("dbus-openrc")
install='dbus.install'
# The dbus.initd has been downloaded from "${url}" at 2016-09-13, and applied the changes in _patch_initscript(), which is there only for reference purposes.
source=(
  "dbus.initd"
  "dbus.install"
)
sha256sums=(
  '20518ae49d0d230de4273f0e4a32edec804cb60f60451b4da9356d7dbe6281cb'
  '03944588f0a4c90f4bcfac96f5bc380473473d65d88d6c2c54b7397fe1103396'
)

# ### The following function is kept for reference purposes only; since the patched sourcefile is locally supplied with this package we do not need to patch.
# _patch_initscript() {
#   sed -e 's|#!/sbin/runscript|#!/usr/bin/openrc-run|' \
#     -e 's|#!/sbin/openrc-run|#!/usr/bin/openrc-run|' \
#     -e 's|/var/run|/run|g' \
#     -e 's|dbus.pid|dbus/pid|g' \
#     -i "${srcdir}/dbus.initd"
# }

package() {
  install -Dm755 "${srcdir}/dbus.initd" "${pkgdir}/etc/init.d/dbus"
}
