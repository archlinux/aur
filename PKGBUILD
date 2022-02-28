# Maintainer: Kookies <kookies@tutamail.com>
_name=ctrcdnfetch
pkgname=$_name-git
pkgver=a8090ef
pkgrel=2
pkgdesc="Download Content from Nintendo CDN after 11.8 (git)"
arch=(x86_64)
url="https://github.com/luigoalma/$_name"
license=('MIT')
depends=('openssl' 'curl')
makedepends=('git')
provides=($_name)
conflicts=($_name)
source=("$_name::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_name"
	git describe --always
}

build() {
	cd "$srcdir/$_name"
	make
}

package() {
	cd "$srcdir/$_name"
	install -D 'bin/ctrcdnfetch' "$pkgdir/usr/bin/$_name"
}
