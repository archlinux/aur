# Maintainer: Nathan Kessler <nathant93@gmail.com>
pkgname=dot-templater
pkgver=1.1.0
pkgrel=1
pkgdesc="Templates a folder of dotfiles, supporting feature flags and string substitutions"
arch=('i686' 'x86_64')
url="https://github.com/kesslern/dot-templater"
license=('MIT')
depends=('glibc')
makedepends=('git' 'cargo')
source=('git+https://github.com/kesslern/dot-templater')
md5sums=('SKIP')

build() {
	cd "$srcdir/$pkgname"
	make release
}

check() {
	cd "$srcdir/$pkgname"
	make test
}

package() {
        cd "$srcdir/$pkgname"
        install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
        install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
