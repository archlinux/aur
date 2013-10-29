# Maintainer: Aleksey Filippov <sarum9in@gmail.com>
pkgname=trellis-desk
pkgver=1.0.4
pkgrel=1
epoch=
pkgdesc="A robust and user-friendly help desk solution for businesses and organizations"
arch=('any')
url="http://www.accord5.com/trellis"
license=('custom')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://www.accord5.com/trellis_desk_v$(echo "$pkgver" | tr -d .)_final.zip")
noextract=()
md5sums=('2d1133183f96b87d1933ad0664e2b248')

_http_writable=(
    core/cache
    core/tmp
    skin
    uploads
    install
)

package() {
    cd "$srcdir/Trellis Desk v${pkgver} Final"
    install -m 755 -d "$pkgdir/usr/share/webapps/$pkgname"
    install -m 644 -D "License.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -m 644 -D "Readme.html" "$pkgdir/usr/share/doc/$pkgname/README.html"
    cd "Upload"
    tar cf - . | (cd "$pkgdir/usr/share/webapps/$pkgname" && tar xf -)
    (cd "$pkgdir/usr/share/webapps/$pkgname" && chown http:http "${_http_writable[@]}")
}
