# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
# Contributor: Joel Goguen <contact+aur@jgoguen.ca>
# Contributor: Jordan Klassen <forivall@gmail.com>
_pkgname='flow'
pkgname="$_pkgname-bin"
pkgver='0.114.0'
pkgrel='3'
pkgdesc='Adds static typing to JavaScript to improve developer productivity and code quality - binary version'
arch=('x86_64')
url="https://$_pkgname.org/"
license=('MIT')
provides=("$_pkgname")
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/facebook/$_pkgname/releases/download/v$pkgver/flow-linux64-v$pkgver.zip"
		"$pkgname-$pkgver-$pkgrel-LICENSE::https://raw.githubusercontent.com/facebook/$_pkgname/v$pkgver/LICENSE")
sha256sums=('828f5c746f22baa41ba306b87c5c12cd49c4182c48436bb31af501366f416fb4'
            'f657f99d3fb9647db92628e96007aabb46e5f04f33e49999075aab8e250ca7ce')

package() {
	cd "$srcdir/"
	install -Dm755 "$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "$pkgname-$pkgver-$pkgrel-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
