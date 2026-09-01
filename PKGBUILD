# Maintainer: Okabe Zero-Link (okbzl) <okabezerolink@gmail.com>

pkgname="degrees-of-lewdity"
pkgver=0.5.12.7
pkgrel=1
pkgdesc="Degrees of Lewdity, browser-based NSFW(18+) game by Vrelnir"
arch=('any')
url="https://vrelnir.blogspot.com"
license=('cc-by-nc-sa-4.0')
makedepends=('git')
provides=(dol)
source=("degrees-of-lewdity::git+https://gitgud.io/Vrelnir/degrees-of-lewdity.git#tag=${pkgver}" 
		'dol' 
		'degrees-of-lewdity.desktop'
		'degrees-of-lewdity.ico')
md5sums=('SKIP'
         '18d1a258ecaff1c9708635ead15df35b'
		 '818293d99934d2b23e506f280856a88c'
		 '7903b57563259ec9a2933b3503980b4d')
         
build() {
	cd "degrees-of-lewdity"
	FORCE_VERSION='' ./compile.sh
}

package() {
	cd "degrees-of-lewdity"
	install -Dm755 "./Degrees of Lewdity.html" "$pkgdir/usr/share/dol/degrees-of-lewdity.html"
	cp -R img "$pkgdir/usr/share/dol/img"
	cp -R game "$pkgdir/usr/share/dol/game"
	cd ..
    install -Dm755 "dol" "$pkgdir/usr/bin/dol"
	install degrees-of-lewdity.ico -Dt "$pkgdir"/usr/share/pixmaps
	install degrees-of-lewdity.desktop -Dt "$pkgdir"/usr/share/applications
}
