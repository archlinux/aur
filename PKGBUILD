# Maintainer: Gabriel Guldner <gabriel at guldner dot eu>
pkgname=hc-utils
pkgver=0.0.4
pkgrel=2
pkgdesc="Utilities to provide an easier and automaic use of features of the Hetzer Cloud platform (e.g. private networks, block storage)"
url='https://github.com/hetznercloud/hc-utils'
arch=('any')
license=('MIT')
depends=('iproute2' 'curl' 'dhclient')
source=("https://packages.hetzner.com/hcloud/deb/hc-utils_${pkgver}-1_all.deb" "LICENSE")
sha256sums=('151e780568cc23970e5f26f24b82dea383a5116197fd91cae9254ec2b23918a7'
            '1695495e846c66824498ba59ecbd71be53f14c7958f2ef98e204cf6dbd9a1689')

package() {
	tar xvf data.* -C "$pkgdir"
	rm -r "$pkgdir/usr/share/doc"
	mv "$pkgdir/lib" "$pkgdir/usr/"
	mv "$pkgdir/usr/sbin" "$pkgdir/usr/bin"
	install -Dm755 LICENSE "$pkgdir/usr/share/licenses/hc-utils/LICENSE"
}
