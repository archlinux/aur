# Maintainer: Roman Geraskin <roman dot n dot geraskin at gmail dot com>

pkgname=kbenv-bin
pkgver=1.0.0
pkgrel=1
pkgdesc='Kubectl version manager inspired by tfenv'
arch=('x86_64')
_goos='linux'
_goarch='amd64'
url='https://github.com/little-angry-clouds/kubernetes-binaries-managers'
license=('GPL3')
provides=("kbenv" "kubectl")
conflicts=("kubectl")
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/kubernetes-binaries-managers_${pkgver}_${_goos}_${_goarch}.tar.gz")
sha256sums=('47bb227c2cf1ee7fae8ebb7f4d9cdcd797fdde1ef0b82a214a945e5e685898f0')

package() {
	install -Dm 755 kubectl-$_goos-$_goarch/kbenv "$pkgdir/usr/bin/kbenv"
	install -Dm 755 kubectl-$_goos-$_goarch/kubectl-wrapper "$pkgdir/usr/bin/kubectl"
}
