# Contributor: Elena ``of Valhalla'' Grandi <elena.valhalla@gmail.com>
# Contributor: Huulivoide <jesse.jaara@gmail.com>
# Maintainer: GordonGR <ntheo1979@gmail.com>

pkgname=ttf-textfonts
pkgver=6.31
pkgrel=1
pkgdesc="Text faces based on early Greek editions"
arch=('any')
url="http://users.teilar.gr/~g1951d/"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
conflicts=('ttf-alexander' 'ttf-alfios' 'ttf-anaktoria' 'ttf-aroania' 'ttf-atavyros' 'ttf-avdira' 'ttf-asea')
source=("http://users.teilar.gr/~g1951d/Aroania.zip"
	"http://users.teilar.gr/~g1951d/Anaktoria.zip"
	"http://users.teilar.gr/~g1951d/Alexander.zip"
	"http://users.teilar.gr/~g1951d/Avdira.zip"
	"http://users.teilar.gr/~g1951d/Asea.zip"
	 "LICENSE")
install=$pkgname.install
md5sums=('9ce238bc6b3bfe4fcaadf8d2f10c6022'
         '64ea1f884be91a2b6e0de43c776ac5e3'
         '3773ef9f17a547cd12b3e170c08068c0'
         'b88dff592adf143f00d195af54f434f9'
         '43e0f2d0d6de7e2138de293c0ad58814'
         'bc1709dc3b1f6a7545ab366923e01a1c')


package()
{
for file in "${srcdir}"/*ttf; do
  install -m 644 -D "${file}" "${pkgdir}/usr/share/fonts/TTF"/$(basename $file)
done

install -m 644 -D $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
