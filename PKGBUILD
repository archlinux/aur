# Maintainer: Balakrishnan Balasubramanian <aur@balki.me>

pkgname=diyvpn
pkgrel=1
pkgver=r7.420798b
pkgdesc='Simple DIY VPN'
arch=('any')
license=('MPL-2.0')
makedepends=('git')
url="https://gitea.balki.me/balki/$pkgname"
source=("git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	cd "$pkgname"
	make PREFIX="$pkgdir/usr" install
}
