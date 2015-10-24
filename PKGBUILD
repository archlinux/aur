# Maintainer : maz-1 <loveayawaka at gmail dot com>

pkgname=danmu2ass
pkgver=1.1
pkgrel=1
pkgdesc="Convert xml/json danmaku to ass subtitle. "
arch=('any')
url="http://danmu2ass.codeplex.com/"
license=('GPL2')
depends=('mono')
source=("Danmu2Ass1.1.zip::http://download-codeplex.sec.s-msft.com/Download/Release?ProjectName=danmu2ass&DownloadId=838758&FileTime=130441118278200000&Build=21031"
		) 
md5sums=('75213f0147f708e617c79dca84d31aab')
noextract=Danmu2Ass1.1.zip

build() {
        true
}

package() {
	install -dm 755 "${pkgdir}/usr/"{share/danmu2ass,bin}
	cd "${pkgdir}/usr/share/danmu2ass"
	unzip "${srcdir}/Danmu2Ass1.1.zip"
	echo '#!/bin/sh' > ${pkgdir}/usr/bin/danmu2ass
	echo 'exec mono /usr/share/danmu2ass/Kaedei.Danmu2Ass.exe "$@"' >> ${pkgdir}/usr/bin/danmu2ass
	chmod +x ${pkgdir}/usr/bin/danmu2ass
}


