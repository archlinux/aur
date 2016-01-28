# Maintainer: Martchus <martchus@gmx.net>

pkgname=isoviewer
pkgver=1.11
pkgrel=1
epoch=1
arch=('any')
pkgdesc="GUI application to have closer look ISO 14496-12 and other MP4 files."
url="https://github.com/sannies/$pkgname"
license=('Apache')
depends=('java-environment')
makedepends=
install=${pkgname}.install
url=
source=("$pkgname-$pkgver.jar::https://github.com/sannies/$pkgname/releases/download/$pkgname-$pkgver/$pkgname-$pkgver-SNAPSHOT.jar"
        "${pkgname}.sh"
        "${pkgname}.desktop"
        "${pkgname}.install")
md5sums=('1acb73c35d689a7c8ce43f5c977a9c1c'
         '46a45db34de39faf0c96b14b7a8b3b0a'
         '27af8fee869cccf25921bbeb14e9c17e'
         'd02e1f3a7dc68114156695e1601975c0')

package() {
  cd $srcdir
  # start script
  install -m755 -D "./${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  # jar file
  install -m644 -D "./$pkgname-$pkgver.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
  # menu entry
  install -m644 -D "./${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
}
