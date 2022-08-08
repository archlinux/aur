# Maintainer: Roman Geraskin <roman dot n dot geraskin at gmail dot com>

pkgname=helmenv-bin
pkgver=1.0.0
pkgrel=1
pkgdesc='Helm version manager inspired by tfenv'
arch=('x86_64')
_goos='linux'
_goarch='amd64'
url='https://github.com/little-angry-clouds/kubernetes-binaries-managers'
license=('GPL3')
provides=("helmenv" "helm")
conflicts=("helm")
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/kubernetes-binaries-managers_${pkgver}_${_goos}_${_goarch}.tar.gz")
sha256sums=('47bb227c2cf1ee7fae8ebb7f4d9cdcd797fdde1ef0b82a214a945e5e685898f0')

package() {
	install -Dm 755 helm-$_goos-$_goarch/helmenv "$pkgdir/usr/bin/helmenv"
	install -Dm 755 helm-$_goos-$_goarch/helm-wrapper "$pkgdir/usr/bin/helm"
}
