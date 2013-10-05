# Maintainer: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Thomas Bächler <thomas@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>

pkgname=initscripts-fork
pkgver=2013.10.1
pkgrel=1
pkgdesc="Maintained fork of system initialization/bootup scripts"
arch=('any')
url="https://bitbucket.org/TZ86/initscripts-fork/overview"
license=('GPL2')
provides=('initscripts-systemd' 'initscripts')
conflicts=('initscripts-systemd' 'initscripts')
replaces=('initscripts-systemd' 'initscripts')
backup=(etc/inittab etc/rc.conf etc/rc.local etc/rc.local.shutdown)
depends=('glibc' 'bash' 'coreutils' 'iproute2' 'ncurses' 'findutils' 'sysvinit' 'procps-ng')
optdepends=('dhcpcd: DHCP network configuration'
            'bridge-utils: Network bridging support'
            'net-tools: Network support'
            'wireless_tools: Wireless networking'
            'systemd: new crypttab format support'
	    'sysctl-default-conf: additional tweaks for kernel parameters')
makedepends=(asciidoc)
install=initscripts.install
source=(https://bitbucket.org/TZ86/$pkgname/get/$pkgver.tar.bz2)
md5sums=('bb6042fe71d9fd1644f0efa1311e8d57')

package() {
  cd TZ86-$pkgname-*

  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
