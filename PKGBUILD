# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>

pkgname=gimp-brushbox
_pkgname=GimpBrushBox
pkgver=2.1
_pkgver=${pkgver/./_}
pkgrel=3
pkgdesc='Set of brushes, presets, dynamics made by GrindGod'
arch=('any')
url='https://grindgod.deviantart.com/art/The-Gimp-BrushBox-v2-1-382881674'
license=('CCPL:cc-by-nc-sa')
depends=(gimp)
# source=("$pkgname-$pkgver.zip::https://orig00.deviantart.net/9956/f/2013/204/d/2/the_gimp_brushbox_v2_1_by_grindgod-d6byhe2.zip")
source=("$pkgname-$pkgver.zip::https://api-da.wixmp.com/_api/download/file?downloadToken=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsImV4cCI6MTU5MzExNDYzNCwiaWF0IjoxNTkzMTE0MDI0LCJqdGkiOiI1ZWY0ZmRiMjBjNjVkIiwib2JqIjpudWxsLCJhdWQiOlsidXJuOnNlcnZpY2U6ZmlsZS5kb3dubG9hZCJdLCJwYXlsb2FkIjp7InBhdGgiOiJcL2ZcL2M5YWQ2YWU4LTZlYTMtNDYzOC1hNjU1LTBmZDFmZGU3Mjc4N1wvZDZieWhlMi00MmU3NTAyYi0yNGRhLTQyMTktYWNiMi03OTMzY2MxMzIyMmQuemlwIiwiYXR0YWNobWVudCI6eyJmaWxlbmFtZSI6InRoZV9naW1wX2JydXNoYm94X3YyXzFfYnlfZ3JpbmRnb2RfZDZieWhlMi56aXAifX19.l18hHO1KddGW8tm9Je6_Qz2zG8Z1788oZfw6nnpNBCg")
options=(!strip)
sha256sums=('0cc922ece8eb59ce84b784ab50ddd60b97b4991590cddcd1fd2fa76220928523')

package(){
  cd "$srcdir"/${_pkgname}_v${pkgver}
  install -Dm644 Readme.txt "$pkgdir"/usr/share/doc/$pkgname/Readme.txt
  install -dm755 "$pkgdir"/usr/share/gimp/2.0
  cp -r --no-preserve=mode {brushes,dynamics,gradients,tool-presets} "$pkgdir"/usr/share/gimp/2.0/
}
