#Base: macfonts
#Fixes: https://bugzilla.mozilla.org/show_bug.cgi?id=491114
#Maintainer: jnbek1972 ___AT____ gmail__DOT__com
#Contributor: Shanto (at hotmail.com)
#Contributor: Erus <erus.iluvatar@gmail.com>
pkgname=ttf-mac-fonts
pkgver=1
pkgrel=7
pkgdesc="Mac fonts including Lucida Grande, Apple Garamond and other fonts from Apple"
arch=('any')
url="http://www.apple.com/safari/"
license=('custom')
depends=()
makedepends=('subversion' 'wget')
conflicts=('macfonts')
source=()
md5sums=()
install='ttf-mac-fonts.install'

package() {
	cd $srcdir
	find -delete
	svn co --force https://svn.code.sf.net/p/macbuntu/code/Macbuntu/fonts/ ./
	install -d $pkgdir/usr/share/fonts/{TTF,Type1}
	install -m644 gbk/*.ttf $pkgdir/usr/share/fonts/TTF
	install -m644 mac/*.ttf $pkgdir/usr/share/fonts/TTF
	install -m644 mac/*.pfb $pkgdir/usr/share/fonts/Type1

	wget http://images.apple.com/legal/sla/docs/SafariWindows.pdf
	install -d $pkgdir/usr/share/licenses/$pkgname
	install -m644 SafariWindows.pdf $pkgdir/usr/share/licenses/$pkgname/
}
