# Maintainer : boronology <boronology at gmail dot com>
pkgname=ttf-rounded-mplus
pkgver=20150110
pkgrel=3
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="Japanese rounded gothic fonts based on M+ FONTS"
arch=('any')
license=('custom')
url="http://jikasei.me/font/rounded-mplus/"
source=("http://sourceforge.jp/frs/chamber_redir.php?m=jaist&f=%2Fusers%2F7%2F7708%2Frounded-mplus-20150110.7z"
	"http://sourceforge.jp/frs/chamber_redir.php?m=jaist&f=%2Fusers%2F7%2F7709%2Frounded-x-mplus-20150110.7z"
	"http://sourceforge.jp/frs/chamber_redir.php?m=osdn&f=%2Fusers%2F7%2F7707%2Frounded-l-mplus-20150110.7z"
	)

install=$pkgname.install

package() {
	cd "$srcdir"

	# install fonts
	for TTF in `ls | grep ttf`
	    do
	    install -Dm644 $TTF "$pkgdir/usr/share/fonts/TTF/$TTF"
	    done

	# install License
	for LICENSE in `ls mplus-TESTFLIGHT-059 | grep LICENSE`
	    do
	    install -Dm644 mplus-TESTFLIGHT-059/$LICENSE \
	    	    "$pkgdir/usr/share/licenses/$pkgname/$LICENSE"
	    done
}

md5sums=('4fa76a841c83bc296ea19a6f6f56b553'
         '4c0e6167d5d35bb685b86acb2653deb7'
         '716d686eee8b402805db51c461da2c84')
