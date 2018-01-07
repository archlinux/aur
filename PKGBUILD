pkgname='todd'
pkgver=3.e217d23
pkgrel=1
pkgdesc='An HTTP server that streams the stdout of a single command. More generic and elegant than woof.'
arch=('any')
url="https://github.com/ewtoombs/$pkgname"
license=('MIT')
depends=('python')
makedepends=()
source=("git+https://github.com/ewtoombs/$pkgname.git")
md5sums=('SKIP')

pkgver () {
    #_date="$(date '+%Y%m%d')"
	cd "$srcdir/$pkgname"
	echo "$(git rev-list --count master).$(git rev-parse --short master)"
}

package () {
    cd "$srcdir/$pkgname"

    install -D -m 0755 'todd' "$pkgdir/usr/bin/todd"
    install -D 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
