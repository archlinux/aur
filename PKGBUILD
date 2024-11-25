# Maintainer: Mohamed Elsayed <mohamed@devlix.org>
pkgname=smbmnt
pkgver='v1.0.r1.afe504b'
pkgrel=2
pkgdesc="Mount samba shares on Linux easily."
arch=("x86_64")
url="https://github.com/Mohamed1242012/smbmnt"
license=('GPL')
depends=('sudo' 'yq' 'util-linux' 'cifs-utils')
makedepends=('git')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}


build() {
	cd "$pkgname"
}

package() {
	cd "$pkgname"
	mkdir -p ~/.config/smbmnt
	install -Dm755 ./smbmnt "$pkgdir/usr/bin/smbmnt"
	install -Dm755 ./config.yaml "$HOME/.config/smbmnt/config.yaml"
	install -Dm644 ./README.md "pkgdir/usr/share/doc/smbmnt/README.md"
  install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/smbmnt/LICENSE"
}