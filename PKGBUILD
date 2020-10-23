# Maintainer: Roman Geraskin <roman dot n dot geraskin at gmail dot com>

pkgname=helmenv-bin
_pkgname="${pkgname%-bin}"
pkgver=0.2.3
pkgrel=1
pkgdesc='Helm version manager inspired by tfenv'
arch=('x86_64')
_goos='linux'
_goarch='amd64'
url='https://github.com/little-angry-clouds/kubernetes-binaries-managers'
license=('GPL3')
provides=("$_pkgname" "helm")
conflicts=("helm")
source=("$pkgname-$pkgver.tar.gz::https://github.com/little-angry-clouds/kubernetes-binaries-managers/releases/download/$pkgver/$_pkgname-$_goos-$_goarch.tar.gz")
sha256sums=(820510e6c01cccf2e50ec82280dd14d2e4b29e75002dc590a1ef0ef78a3c5a20)

package() {
	install -Dm 755 $_pkgname-$_goos-$_goarch "$pkgdir/usr/bin/$_pkgname"
	install -Dm 755 helm-wrapper-$_goos-$_goarch "$pkgdir/usr/bin/helm"
}