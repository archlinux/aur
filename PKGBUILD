pkgname=cleanmedia
pkgver=0.3
pkgrel=1
pkgdesc="A poor man's data rentention policy tool for dendrite home servers"
arch=(any)
url=https://gitlab.com/rogs/cleanmedia
license=(GPL-3.0-or-later)
# refs/tags/v$pkgver
_commit=4ddec53928d5f8924080343066e66c86be168cd2
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/rogs/cleanmedia/-/archive/$_commit/cleanmedia-$_commit.tar.gz")
sha256sums=('d22f552e5d10375642361e61785655c0cd6677c0f46cb1a26d0fcde77e95fa0a')

package() {
    depends+=(python-psycopg2 python-yaml)
    install -Dm755 "$srcdir/$pkgname-$_commit/cleanmedia" \
    	"$pkgdir/usr/bin/cleanmedia"
}
