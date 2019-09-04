# Maintainer: Brad Erhart <brae.04+aur@gmail.com>

pkgname=eksctl-bin
_pkgname=${pkgname%-bin}
pkgver=0.5.0
pkgrel=1
pkgdesc="A simple CLI tool for creating clusters on Amazon's EKS"
arch=(x86_64)
url='https://eksctl.io'
license=(Apache)
depends=(kubectl)
conflicts=($name)

source=("https://github.com/weaveworks/eksctl/releases/download/$pkgver/${_pkgname}_Linux_amd64.tar.gz")
sha256sums=(7b24b1865fc5de425cd56b2d8015ebfa7e4d2220571eee83f902712ac6d93b0d)

package() {
	cd "$srcdir"
	install -d "$pkgdir/usr/bin"
	install -m755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
}
