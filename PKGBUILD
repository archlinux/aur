# Maintainer : boronology <boronology at gmail dot com>
pkgname=ttf-rounded-mplus
pkgver=20150529
pkgrel=1
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="Japanese rounded gothic fonts based on M+ FONTS"
arch=('any')
license=('custom')
url="http://jikasei.me/font/rounded-mplus/"
source=("http://osdn.jp/frs/chamber_redir.php?m=iij&f=%2Fusers%2F8%2F8569%2Frounded-mplus-20150529.7z"
	"http://osdn.jp/frs/chamber_redir.php?m=iij&f=%2Fusers%2F8%2F8570%2Frounded-x-mplus-20150529.7z"
	"http://osdn.jp/frs/chamber_redir.php?m=iij&f=%2Fusers%2F8%2F8568%2Frounded-l-mplus-20150529.7z")

install=$pkgname.install

package() {
	cd "$srcdir"

	# install fonts
	for TTF in `ls *.ttf`
	    do
	    install -Dm644 $TTF "$pkgdir/usr/share/fonts/TTF/$TTF"
	    done

	# install License
	cd "$srcdir/mplus-TESTFLIGHT-059"
	for LICENSE in `ls LICENSE*`
	    do
	    install -Dm644 $LICENSE \
	    	    "$pkgdir/usr/share/licenses/$pkgname/$LICENSE"
	    done
}

md5sums=('e3725fe7982cac2819357439af41cafd'
         '3fcce4e7549fce7fc506dfd45474a91f'
         '76ff93e8a3fe0ed16e11bf25abae4c60')
