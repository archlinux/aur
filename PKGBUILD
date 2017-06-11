# Maintainer: Giuseppe <giuscri@gmail.com>
pkgname='pyswitch-git'
pkgver=r2.240a8f0
pkgrel=1
pkgdesc="Easily switch between python2 and python3"
arch=('x86_64')
url="https://github.com/giuscri/pyswitch"
license=('WTFPL')
depends=('python-colorama' 'python2-colorama')
makedepends=('git')
source=("$pkgname::git+https://github.com/giuscri/pyswitch.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm0755 "$srcdir/$pkgname/pyswitch" "$pkgdir/usr/bin/pyswitch"
    install -Dm0644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/pyswitch/LICENSE"
}
