# Maintainer: Roman Geraskin <roman dot n dot geraskin at gmail dot com>

pkgname=kbenv-bin
_pkgname="${pkgname%-bin}"
pkgver=0.2.5
pkgrel=2
pkgdesc='Kubectl version manager inspired by tfenv'
arch=('x86_64')
_goos='linux'
_goarch='amd64'
url='https://github.com/little-angry-clouds/kubernetes-binaries-managers'
license=('GPL3')
provides=("$_pkgname" "kubectl")
conflicts=("kubectl")
source=("$pkgname-$pkgver.tar.gz::https://github.com/little-angry-clouds/kubernetes-binaries-managers/releases/download/$pkgver/$_pkgname-$_goos-$_goarch.tar.gz")
sha256sums=(2efba990d4a3d268eb0c8b9f1e5bb553944d4bb040529960c7ad971fad23f75a)

package() {
	install -Dm 755 $_pkgname-$_goos-$_goarch "$pkgdir/usr/bin/$_pkgname"
	install -Dm 755 kubectl-wrapper-$_goos-$_goarch "$pkgdir/usr/bin/kubectl"
}
