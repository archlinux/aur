# Maintainer: VZstless <i [at] vzstless [dot] moe>
# Contributor: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=ipfetch-git
pkgver=r62.a9cf53c
pkgrel=1
pkgdesc="Neofetch like tool that can lookup IPs"
arch=('any')
url="https://github.com/trakBan/ipfetch"
license=("GPL-3.0-only")
depends=("wget")
makedepends=("git")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
md5sums=(SKIP)

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	install -d "$pkgdir/usr/share"
	cp -a flags "$pkgdir/usr/share/${pkgname%-git}"
	install -Dm755 ipfetch-wget -t "$pkgdir/usr/bin"
}
