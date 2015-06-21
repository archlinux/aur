# $Id: PKGBUILD 100111 2010-11-20 11:25:37Z pierre $
# Maintainer: Thomas Bächler <thomas@archlinux.org>
# Maintainer: Aaron Griffin <aaron@archlinux.org>

pkgname=networkmod
pkgver=2010.07
pkgrel=1
pkgdesc="Modified version of the Arch initscript's Network daemon, with hooks."
arch=('i686' 'x86_64')
url="http://xyne.archlinux.ca/scripts/arch/"
license=('GPL')
depends=('initscripts')
optdepends=('bridge-utils: Network bridging support'
            'dhcpcd: DHCP network configuration'
            'wireless_tools: Wireless networking')
source=("ftp://ftp.archlinux.org/other/initscripts/initscripts-${pkgver}-1.tar.xz"
        'hooks.patch')
md5sums=('0cea15a64d999d0e1aa0c4bb4dbd1af8'
         '5006fd23407dea751fdbd23625607ede')

package() {
  cd "${srcdir}/initscripts-${pkgver}-1"
  patch network "$srcdir/hooks.patch"
  install -Dm755 network "$pkgdir/etc/rc.d/networkmod"
}
