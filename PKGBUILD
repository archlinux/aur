# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)
# Contributor : Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor : Aaron Griffin <aaron@archlinux.org>


pkgname=vim-taglist

epoch=1
pkgver=4.6
_scriptid=19574
pkgrel=1

pkgdesc='A source code browser plugin for vim'
arch=('any')
url="http://$pkgname.sourceforge.net"
license=('custom')

makedepends=('unzip')
depends=('vim' 'ctags')

groups=('vim-plugins')

source=("taglist_$pkgver.zip::https://www.vim.org/scripts/download_script.php?src_id=$_scriptid"
		'license.txt')
b2sums=('d50df26553899ee06bf35e187438f62d08b06004eecce429e34a1c480adcb7ca4ca370bb4bdcbb7d0d9c1830536bb10600f9e30653d32248ff60dfda77b2de88'
        '99177e1d6f81699a6985e92ea70eb19ff48e31bbb3b7cc2d8d0e8b66e10c564b71b8ce7e26f85282fdc9145e75b67e4804bf31e939e65ca78fec2fd31ce1a502')


prepare() {
	unzip -qqo "taglist_$pkgver.zip"
}

package() {
	install -Dm644 doc/taglist.txt    -t"$pkgdir/usr/share/vim/vimfiles/doc/"
	install -Dm644 plugin/taglist.vim -t"$pkgdir/usr/share/vim/vimfiles/plugin/"
	install -Dm644 license.txt        -t"$pkgdir/usr/share/licenses/vim-taglist/"
}


# vim: ts=4 sw=4 noet ft=PKGBUILD:
