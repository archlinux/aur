# Maintainer: hadenodom <hadenodom@gmail.com>

pkgname=bullsandcows
pkgver=0.1
pkgrel=1
pkgdesc="A simple implementation of the classic 'Bulls and Cows' game written in Python"
arch=('any')
url="https://github.com/hadenodom/Bulls-and-Cows"
license=('MIT')
depends=('python3')

source=($pkgname::"git+https://github.com/hadenodom/Bulls-and-Cows#branch=master")

md5sums=('SKIP')
# Temporary, until I figure out how to automate making & uploading a new pkgbuild every time the git source changes

package() {
	cd "${srcdir}/${pkgname}"
	ls

	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	mv bullscows.py ${pkgname}

	install -m 755 -d "${pkgdir}/usr/bin"
	install -m 755 -t "${pkgdir}/usr/bin/" "bullsandcows"
} 
