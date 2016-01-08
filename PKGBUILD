# Contributor: tze <tze@datalove.me>

pkgname=ttf-unifraktur
pkgver=20140706
pkgrel=2
pkgdesc='A set of open-source Fraktur fonts'
arch=('any')
url='http://unifraktur.sourceforge.net'
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=(http://downloads.sourceforge.net/project/unifraktur/fonts/UnifrakturMaguntia.2014-07-06.zip
        http://downloads.sourceforge.net/project/unifraktur/fonts/UnifrakturCook.2013-08-25.zip)
md5sums=('50b1fb0cfa7369ec5975c44d48fe9ac1'
         'e93c4f39f7ce6642fdf7ebc3d8ab19fe')

package() {
	install -d "$pkgdir/usr/share/fonts/TTF"
	install -m644 "$srcdir"/*/*.ttf "$pkgdir/usr/share/fonts/TTF"
	install -d "$pkgdir/usr/share/licenses/$pkgname"
	install -m644 "$srcdir"/*Maguntia*/OFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE-UnifrakturMaguntia"
	install -m644 "$srcdir"/*Cook*/OFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE-UnifrakturCook"
	install -m644 "$srcdir"/*Cook*/OFL-FAQ.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE-FAQ"
}
