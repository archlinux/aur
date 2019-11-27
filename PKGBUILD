# Maintainer: Stefan Cocora <stefan dot cocora at gmail dot com>
# Maintainer: Brad Erhart <brae dot 04 plus aur at gmail dot com>
# Maintainer: Michael Beaumont <mjboamail at gmail dot com>
# Maintainer: André Sterba <arch at andre hypen sterba dot de>

pkgname=skaffold-bin
_pkgname="${pkgname%-bin}"
pkgver=1.0.1
pkgrel=2
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
sha256sums=('f53e84288e044a3281e43adbc571a03271b7ee1d7b21781cc2a47248501e3964')

package() {
	install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
	"$pkgdir/usr/bin/$_pkgname" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
	"$pkgdir/usr/bin/$_pkgname" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
}
