# Maintainer: André Sterba <arch at andre hypen sterba dot de>
# Maintainer: Brad Erhart <brae dot 04 plus aur at gmail dot com>
# Maintainer: Michael Beaumont <mjboamail at gmail dot com>
# Maintainer: Stefan Cocora <stefan dot cocora at gmail dot com>

pkgname=skaffold-bin
_pkgname="${pkgname%-bin}"
pkgver=1.9.1
pkgrel=1
pkgdesc='Command line tool that facilitates continuous development for Kubernetes applications'
arch=('x86_64')
_goos='linux'
_goarch='amd64'
url='https://skaffold.dev'
license=('Apache')
optdepends=('bash-completion: for tab completion')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname-$pkgver::https://storage.googleapis.com/$_pkgname/releases/v$pkgver/$_pkgname-$_goos-$_goarch")
sha256sums=('6078dbaa83dcfbeeef4ebdce0f6cfeff510cc34b6f3156b32b256d02a74973e5')

package() {
	install -Dm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
	"$pkgdir/usr/bin/$_pkgname" completion bash | install -Dm 644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
	"$pkgdir/usr/bin/$_pkgname" completion zsh | install -Dm 644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
}
