# Maintainer: Brad Erhart <brae.04+aur@gmail.com>

pkgname=eksctl-bin
_pkgname=${pkgname%-bin}
pkgver=0.1.35
pkgrel=1
pkgdesc="A simple CLI tool for creating clusters on Amazon's EKS"
arch=(x86_64)
url='https://eksctl.io'
license=(Apache)
depends=(kubectl)
conflicts=($name)

source=("https://github.com/weaveworks/eksctl/releases/download/$pkgver/${_pkgname}_Linux_amd64.tar.gz")
sha256sums=(7abeb72f83fa844ff50c7cc3b24ed46104d0efd12ce37f31f76e71217cd3cc77)

package() {
	cd "$srcdir"
	install -d "$pkgdir/usr/bin"
	install -m755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
}
