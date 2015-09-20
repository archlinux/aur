# Maintainer: Markus Gräb <m_graeb11@cs.uni-kl.de>
pkgname=scapy3k-git
pkgver=r170.1be81b9
pkgrel=1
pkgdesc="scapy for python3 (aka scapy3k)"
arch=('any')
url="https://github.com/phaethon/scapy"
license=('GPLv2')
groups=()
depends=('python' 'tcpdump')
makedepends=('git')
source=('git+https://github.com/phaethon/scapy.git')
md5sums=('SKIP')
conflicts=('scapy')

pkgver() {
	cd "$srcdir/scapy" 
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/scapy"
    python setup.py install --root=$pkgdir --optimize=1
}
