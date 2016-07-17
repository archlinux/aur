# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=pcap2har-git
pkgver=195+gb13c49e
pkgrel=1
pkgdesc="Convert .pcap file to .har (HTTP Archive)"
arch=('any')
url="https://github.com/andrewf/pcap2har"
license=('custom')
depends=('python2-dpkt')
provides=('pcap2har')
source=('git://github.com/andrewf/pcap2har.git')
md5sums=('SKIP')

pkgver() {
	cd "pcap2har"
	echo "$(git rev-list --count HEAD)+g$(git rev-parse --short HEAD)"
}

package() {
	cd $srcdir/pcap2har
	install -d pcap2har ${pkgdir}/usr/lib/python2.7/site-packages/
	mv pcap2har ${pkgdir}/usr/lib/python2.7/site-packages/
	sed -i '1s/python/python2/' main.py
	install -Dm755 main.py ${pkgdir}/usr/bin/pcap2har
	install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/pcap2har/LICENSE
}
