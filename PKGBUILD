# Contributor: danitool
pkgname=netdiscover
pkgver=0.3prebeta7
pkgrel=0
pkgdesc="network address discovering tool that was developed mainly for those wireless networks without DHCP servers, though it also works on wired networks. It sends ARP requests and sniffs for replies"
arch=('i686' 'x86_64')
url="http://nixgeneration.com/~jaime/netdiscover/"
license=('GPL')
depends=('libnet' 'libpcap')
makedepends=('gcc' 'make' 'wget')
provides=('netdiscover')
conflicts=('netdiscover-debian' 'netdiscover-svn')
replaces=()
backup=()
groups=()
options=()
source=("https://sourceforge.net/projects/${pkgname}/files/${pkgname}/0.3-pre-beta7-LINUXONLY/${pkgname}-0.3-pre-beta7-LINUXONLY.tar.gz")

md5sums=('8780e66d00496e933b4064cfe9ae61da')

build() {
	cd ${srcdir}/netdiscover-0.3-pre-beta7
	./configure --sbindir=/usr/bin --prefix=/usr --sysconfdir=/etc/
	make || return 1
	}
	
package() {
	cd ${srcdir}/netdiscover-0.3-pre-beta7
	make DESTDIR=${pkgdir} install || return 1
	rm -rf ${pkgdir}/usr/doc
}
