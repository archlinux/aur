# Maintainer : boronology <boronology at gmail dot com>
pkgname=ttf-rounded-mplus
pkgver=20150529
pkgrel=3
depends=('fontconfig' 'xorg-mkfontscale')
pkgdesc="Japanese rounded gothic fonts based on M+ FONTS"
arch=('any')
license=('custom')
url="http://jikasei.me/font/rounded-mplus/"
source=("https://ftp.iij.ad.jp/pub/osdn.jp/users/8/8569/rounded-mplus-20150529.7z"
        "https://ftp.iij.ad.jp/pub/osdn.jp/users/8/8570/rounded-x-mplus-20150529.7z"
        "https://ftp.iij.ad.jp/pub/osdn.jp/users/8/8568/rounded-l-mplus-20150529.7z")

install=$pkgname.install

package() {
	cd "$srcdir"

	# install fonts
	for TTF in *.ttf; do
	    install -Dm644 $TTF "$pkgdir/usr/share/fonts/TTF/$TTF"
	done

	# install License
	cd "$srcdir/mplus-TESTFLIGHT-059"
	for LICENSE in $(ls LICENSE*); do
	    install -Dm644 $LICENSE \
	    	    "$pkgdir/usr/share/licenses/$pkgname/$LICENSE"
	done
}
sha256sums=("e746736c8ded99fe9a9dd72a241ec59435eaa282a18e7ac33a26dc0578c06ff7"
         "22a20428d953ded808ddf391868d1c0c3d3aae933a299e947e5094df525faf31"
         "44ebd9b9a18576374ef1c40c6c02a44ccab031e70f433b5547d4ae11bb6fe76a")
