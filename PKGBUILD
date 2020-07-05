# Maintainer: Étienne Deparis <etienne@depar.is>

pkgname=boston-icon-theme
pkgver=0.7
pkgrel=1
_upname=Boston
pkgdesc="A highly minimalist icon theme, with a sober color palette inspired on basic hues and forms."
arch=('any')
url="https://www.opendesktop.org/p/1012402"
license=('CCPL:by-sa')
source=("https://dllb2.pling.com/api/files/download/j/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE1ODg4ODU3NzgiLCJ1IjpudWxsLCJsdCI6ImRvd25sb2FkIiwicyI6IjIzOTJmYzEwNzAzMTM5ODNiZGNjMzUzNzBiYmM5ZDM0ODRiYzRhMTk0OTZjN2JhNGYyODFiMDk5Yzg4MjI2NjNlMGVhZWUwYTJmMmM2OTgwMmNjYzFhNDUyMTk0YmU2OWU0MDQ0ODYxYTU1ZGVkYmNlZDJmYzVjNzNkOTNiZjMxIiwidCI6MTU5Mzk1ODc5MSwic3RmcCI6IjU5NzgxNGUwN2RkYTliNzJmMmI5MTRhMmJkMzVhOWIyIiwic3RpcCI6IjJhMDE6Y2IwNTo4ZmQ5OjFlMDA6ZjVhYTphM2E6NDU5ZjozMjU1In0.aijbVuTcpSAmPpflcICIchM8JriF_rkCi7crYnyj0tI/Boston-Icons-$pkgver.tar.xz")
sha256sums=('e4d1a9c74c593afcb30cf43759ed2dd6d37e52a901d982bb43bc286ef0604456')
options=(!emptydirs)

package() {
    cd "$srcdir/${_upname}"

    install -d -m755 $pkgdir/usr/share/licenses/$pkgname
    install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
    install -D -m644 "THIRD PARTY" $pkgdir/usr/share/licenses/$pkgname/THIRD_PARTY
    install -D -m644 PATRONS.md $pkgdir/usr/share/licenses/$pkgname/PATRONS

    install -d -m755 $pkgdir/usr/share/icons/$_upname
    for size in 16 48 128 legacy symbolic; do
        mv $size "$pkgdir/usr/share/icons/${_upname}/$size"
    done
    install -D -m644 index.theme "$pkgdir/usr/share/icons/${_upname}/index.theme"
}
