# Maintainer: Balakrishnan Balasubramanian <aur@balki.me>

_pkgname=diyvpn
pkgname=diyvpn-git
pkgrel=1
pkgver=r8.614f694
pkgdesc='Simple DIY VPN'
arch=('any')
license=('MPL-2.0')
makedepends=('git')
url="https://gitea.balki.me/balki/$_pkgname"
source=("git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	cd "$_pkgname"
	make PREFIX="$pkgdir/usr" install
}
