# Maintainer: Zuyi Hu <hzy068808@gmail.com>
pkgname=eclipse-zylin
pkgver=4.18.1
pkgrel=2
pkgdesc="Zylin Embedded CDT Plugin"
arch=('any')
url="http://opensource.zylin.com/embeddedcdt.html"
install="eclipse-zylin.install"
license=("GPL")
depends=('eclipse' 'eclipse-cdt')
source=("http://opensource.zylin.com/zylincdt/features/com.zylin.cdt.feature_$pkgver.jar"
        "http://opensource.zylin.com/zylincdt/plugins/com.zylin.embeddedcdt_$pkgver.jar")
noextract=("com.zylin.cdt.feature_$pkgver.jar"
           "com.zylin.embeddedcdt_$pkgver.jar")
md5sums=('a48c3412b20d7c61fba2786b865cd1be'
         '3c9847debea102c119437f8fec81778d')
 
package() {
  _dest="${pkgdir}/usr/share/eclipse/dropins/zylin/eclipse"
 
  cd "${srcdir}"
  mkdir -p "$_dest"

  mkdir -p "${_dest}/features/com.zylin.cdt.feature_$pkgver"
  bsdtar -xf com.zylin.cdt.feature_$pkgver.jar -C \
  "${_dest}/features/com.zylin.cdt.feature_$pkgver"

  mkdir -p "${_dest}/plugins/com.zylin.embeddedcdt_$pkgver"
  bsdtar -xf com.zylin.embeddedcdt_$pkgver.jar \
  -C "${_dest}/plugins/com.zylin.embeddedcdt_$pkgver"

}
