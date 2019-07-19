# Maintainer: Everton Cosmo <everton8cosmo at gmail dot com>
pkgname=4kvideodownloader-bin
_pkgname=4kvideodownloader
pkgver=4.8.0.2852
_pkgver=4.8.0
pkgrel=1
pkgdesc="Download online video. 4K Video Downloader allows to download video and audio content from YouTube and other services."
arch=('x86_64')
url="http://www.4kdownload.com/products/product-videodownloader"
license=('custom:eula')
depends=('ffmpeg' 'openssl-1.0' 'portaudio' 'qt5-base' 'qt5-declarative')
makedepends=('patchelf')
options=('!strip' '!emptydirs')
install=${_pkgname}.install
source=("${_pkgname}_${pkgver}_amd64.deb"::"https://dl.4kdownload.com/app/${_pkgname}_${_pkgver}-${pkgrel}_amd64.deb")
md5sums=('51fa19c47c845f05317394c6dd082678')


package(){

	# extracting data.tar.xz 

	bsdtar xf data.tar.xz -C "$pkgdir/"

	# remove insecure RPATH
 	patchelf --remove-rpath "$pkgdir"/usr/lib/4kvideodownloader/${_pkgname}-bin

	# shared license
	install -Dm 755 "$pkgdir"/usr/lib/4kvideodownloader/translation/license_zh_TW.qm\
					"$pkgdir"/usr/share/licenses/${_pkgname}/LICENSE

	install -Dm 755 "$pkgdir"/usr/share/doc/4kvideodownloader/copyright\
					"$pkgdir"/usr/share/licenses/${_pkgname}/COPYRIGHT

	install -Dm 644 "$pkgdir"/usr/share/doc/4kvideodownloader/eula\
					"$pkgdir"/usr/share/licenses/${_pkgname}/EULA

	
	
	
	

}

md5sums=('51fa19c47c845f05317394c6dd082678')
