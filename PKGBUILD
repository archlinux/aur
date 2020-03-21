# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
# Contributor: Joel Goguen <contact+aur@jgoguen.ca>
# Contributor: Jordan Klassen <forivall@gmail.com>
_pkgname='flow'
pkgname="$_pkgname-bin"
pkgver='0.121.0'
pkgrel='1'
pkgdesc='A static type checker for JavaScript - binary version'
arch=('x86_64')
url="https://$_pkgname.org/"
license=('MIT')
optdepends=('bash-completion: Bash completion')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
	"$pkgname-$pkgver-$pkgrel.zip::https://github.com/facebook/$_pkgname/releases/download/v$pkgver/$_pkgname-linux64-v$pkgver.zip"
	"$pkgname-$pkgver-$pkgrel-bash-completion::https://github.com/facebook/$_pkgname/raw/v$pkgver/resources/shell/bash-completion"
	"$pkgname-$pkgver-$pkgrel-LICENSE::https://github.com/facebook/$_pkgname/raw/v$pkgver/LICENSE"
)
sha256sums=('df4458ea60cb231d721f06fac916b5ccd4273ce53c9f1540cbb0788dd7a26198'
            'f661f361cc724023919bf455ede48b69d96a60e43aec1908356ed1feede4aa0c'
            'f657f99d3fb9647db92628e96007aabb46e5f04f33e49999075aab8e250ca7ce')

package() {
	cd "$srcdir/"
	install -Dm755 "$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "$pkgname-$pkgver-$pkgrel-bash-completion" "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
	install -Dm644 "$pkgname-$pkgver-$pkgrel-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
