pkgname=dummiesnmap
pkgver=1.0.0
pkgrel=1
pkgdesc="A dumbed-down version of nmap, wrapped in python, for people who can't remember 50 million flags"
arch=('any')
url="https://github.com/kaizokuv/dummiesnmap"
license=('GPL3')
depends=('python')
makedepends=()
source=("https://github.com/kaizokuv/dummiesnmap/archive/refs/tags/v1.0.0.tar.gz")
sha256sums=('10df19e2e8139e6ab9b5018fc3f8e4738a92ed0962c9860513d71e4d2659bb30') 

package() {
	mkdir -p "$pkgdir/usr/lib/dummiesnmap"
	cp main.py "$pkgdir/usr/lib/dummiesnmap/main.py"
	cp -r modules "$pkgdir/usr/lib/dummiesnmap/"
	cat << 'EOF' > "$pkgdir/usr/bin/dummiesnmap"
#!/usr/bin/env bash
PYTHONPATH=/usr/lib/dummiesnmap python3 /usr/lib/dummiesnmap/main.py "$@"
EOF

	chmod +x "$pkgdir/usr/bin/dummiesnmap"
}
