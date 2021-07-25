# Maintainer: Davide Depau <davide@depau.eu>

pkgname=cni-plugins-nftables-forcenft
pkgver=1.0
pkgrel=1
pkgdesc="Replace CNI iptables plugins with nftables counterparts"
arch=('any')
url="https://aur.archlinux.org/pacakges/cni-plugins-nftables-git"
license=('apache')
source=(10-cni-force-nftables.hook cni_force_nftables.sh)
depends=(bash cni-plugins cni-plugins-nftables)
sha256sums=('8452f1618be58fd01d6b9ed79d54dc34f1f9a119b429afa38de4bfac168bddaa'
            'd2b37416a41ce5f635bfead970d3ee8553a603746a34fb89e6eec1efce82e16f')

package() {
	install -Dm755 cni_force_nftables.sh "$pkgdir/usr/lib/cni_force_nftables.sh"
	install -Dm644 10-cni-force-nftables.hook "$pkgdir/usr/share/libalpm/hooks/10-cni-force-nftables.hook"
}
