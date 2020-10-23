# Maintainer: Roman Geraskin <roman dot n dot geraskin at gmail dot com>

pkgname=kbenv-bin
_pkgname="${pkgname%-bin}"
pkgver=0.2.3
pkgrel=1
pkgdesc='Kubectl version manager inspired by tfenv'
arch=('x86_64')
_goos='linux'
_goarch='amd64'
url='https://github.com/little-angry-clouds/kubernetes-binaries-managers'
license=('GPL3')
provides=("$_pkgname" "kubectl")
conflicts=("kubectl")
source=("$pkgname-$pkgver.tar.gz::https://github.com/little-angry-clouds/kubernetes-binaries-managers/releases/download/$pkgver/$_pkgname-$_goos-$_goarch.tar.gz")
sha256sums=(132b54da1bde4adb3c087ba2b98a567164ce1bafe896ce91f9338c60912d2b4d)

package() {
	install -Dm 755 $_pkgname-$_goos-$_goarch "$pkgdir/usr/bin/$_pkgname"
	install -Dm 755 kubectl-wrapper-$_goos-$_goarch "$pkgdir/usr/bin/kubectl"
}