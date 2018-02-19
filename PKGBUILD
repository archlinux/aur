# Maintainer: Andras Wacha <awacha@gmail.com>
pkgname=cistem-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="User-friendly software to process cryo-EM images of macromolecular complexes"
arch=(x86_64)
url="http://cistem.org"
license=('custom')
depends=()
conflicts=('unblur')
provides=('unblur')
source=("cistem-${pkgver}-beta-intel-linux.tar.gz::https://cistem.org/system/tdf/upload3/cistem-1.0.0-beta-intel-linux.tar.gz?file=1" 
	'LICENSE'
	'cistem.sh'
	'cistem.csh' )
sha256sums=('7f1df4dc2aa066387a791d2a4dcb539ff6cf7f124ac1ad5a793c401279f22082'
            '5252841f1b4b944841f7b038fd331ab480488c94122e55d3d16c14af2665971b'
            '83e6cc7be8b2f0042647c4f8d39c26cd0a076f60af17b5b552561e735cb32bb1'
            '05be2ae3e7e943cafa2139e71a35c6b4fc45d056d2c95049d4b2154a9158838c')

options=()

prepare () {
	echo "The program cisTEM was developed by Tim Grant, Alexis Rohou and Nikolaus Grigorieff. This software is licensed under the terms of the Janelia Research Campus Software Copyright 1.1."
}

#build() {
#	return 0
#}

package() {
	cd "$srcdir/cistem-${pkgver}-beta"
	install -d "$pkgdir/opt/cisTEM/bin" "${pkgdir}/opt/cisTEM/share/licenses/${pkgname}" "${pkgdir}/etc/profile.d"
	install -D -m755 * "${pkgdir}/opt/cisTEM/bin"
	install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/opt/cisTEM/share/licenses/${pkgname}/LICENSE"
	install -D -m755 "${srcdir}/cistem.sh" "${srcdir}/cistem.csh" "${pkgdir}/etc/profile.d/"
}
