# Maintainer: Brad Erhart <brae.04+aur@gmail.com>

pkgname=eksctl-bin
_pkgname=${pkgname%-bin}
pkgver=0.1.33
pkgrel=1
pkgdesc="A simple CLI tool for creating clusters on Amazon's EKS"
arch=(x86_64)
url='https://eksctl.io'
license=(Apache)
depends=(kubectl)
conflicts=($name)

source=("https://github.com/weaveworks/eksctl/releases/download/$pkgver/${_pkgname}_Linux_amd64.tar.gz")
sha256sums=(c8fa80914aab576e69e7c8e33e72d01cd07e34514733f091a0ef2dbef00e124e)

package() {
	cd "$srcdir"
	install -d "$pkgdir/usr/bin"
	install -m755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
}
