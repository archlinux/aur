
# Maintainer: SpamixOfficial <spamixofficial@gmail.com>
pkgname=hashzam-git
pkgver=1.0.1
pkgrel=1
pkgdesc="A simple command line tool written in python that calculate and compare hashes!"
arch=(x86_64)
url="https://github.com/SpamixOfficial/hashzam-git.git"
license=('GPL-3.0')
depends=()
makedepends=(git python-pip python)
optdepends=()
provides=(hashzam)
source=("git+$url")
md5sums=('SKIP')



build() {
	pip install colorama
}

package() {
	cd "hashzam-git"
	#if [ ! -d "/usr/share/licenses/${pkgname}" ]; then
	#	mkdir "$pkgdir/usr/share/licenses/${pkgname}"
	#fi
	#if [ ! -d "/usr/share/doc/${pkgname}" ]; then
	#	mkdir "$pkgdir/usr/share/doc/${pkgname}"
	#fi
	chmod +x hashzam.py 
	if [ ! -f "/usr/bin/hashzam" ]; then
		install -d "${pkgdir}/usr/bin/hashzam/"
		install hashzam.py "${pkgdir}/usr/bin/hashzam/"
	else
		install -d "${pkgdir}/usr/bin/hashzam/"
		#install -b "${pkgdir}/usr/local/bin/hashzam" "${pkgdir}/usr/local/bin/hashzam.old"
		install hashzam.py "${pkgdir}/usr/bin/hashzam/"
	fi
	if [ ! -f "/usr/share/licenses/${pkgname}/LICENSE" ]; then
		install -d LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	else
		# "/usr/share/licenses/${pkgname}/LICENSE"
		#cp LICENSE "/usr/share/licenses/${pkgname}/LICENSE"
		install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	fi
	if [ ! -f "/usr/share/doc/${pkgname}/README.md" ]; then
		install -d README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	else
		#rm -f "/usr/share/doc/${pkgname}/README.md"
		#cp README.md "/usr/share/doc/${pkgname}/README.md"
		install -D README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	fi
}
