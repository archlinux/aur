# Maintainer: Stefan Cocora <stefan dot cocora at gmail dot com>
# Maintainer: Brad Erhart <brae dot 04 plus aur at gmail dot com>
# Maintainer: Michael Beaumont <mjboamail at gmail dot com>
# Maintainer: André Sterba <arch at andre hypen sterba dot de>

pkgname=skaffold-bin
_pkgname="${pkgname%-bin}"
pkgver=1.2.0
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
sha256sums=('8c435b3faab09f697724f4ae48bb0cf203ae8490c431db35329674ef2aab5660')

package() {
	install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
	"$pkgdir/usr/bin/$_pkgname" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
	"$pkgdir/usr/bin/$_pkgname" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
}
