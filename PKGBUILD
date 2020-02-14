# Maintainer: Mikael Blomstrand <mikael ÅT mbloms DÖT se>
# Contributor: Jendrik Wenke <jendrikwenke+aur at gmail dot com>

pkgname=scala-dotty
_reltag=0.24.0-RC1
pkgver=${_reltag//-/}
pkgrel=1
pkgdesc='Research compiler that will become Scala 3'
arch=('any')
url='http://dotty.epfl.ch'
license=('BSD')
depends=('java-environment>=8' 'java-environment<=11')
source=("https://github.com/lampepfl/dotty/releases/download/${_reltag}/dotty-${_reltag}.tar.gz")
sha1sums=('748286ef8428f0dbb550c2d8815510a6ab33f9f8')
sha256sums=('361d703dd310cb02e3379695df422f00319d5e70264b7ffeaf1b6c227906df5f')
sha512sums=('1d3d94cd7cf5072db1ca565247bd81aa02dbb80443312057df90f29b0e5adb485076f675c3da2c539630378cbd8c6d27357bef9f89d88cefe9964c07c257447e')

package() {
       install -d "${pkgdir}/usr/bin" "${pkgdir}/usr/share/scala-dotty/bin"
       cp -r "${srcdir}/dotty-${_reltag}/lib" "${pkgdir}/usr/share/scala-dotty"
       install -m755 "${srcdir}/dotty-${_reltag}/bin/"* "${pkgdir}/usr/share/scala-dotty/bin"
       ln -s "../share/scala-dotty/bin/dotc" "${pkgdir}/usr/bin/dotc"
       ln -s "../share/scala-dotty/bin/dotd" "${pkgdir}/usr/bin/dotd"
       ln -s "../share/scala-dotty/bin/dotr" "${pkgdir}/usr/bin/dotr"
}
