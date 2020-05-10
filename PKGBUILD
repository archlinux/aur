# Maintainer: Ilya Elenskiy 

pkgname=megax-bin
pkgver=10.1.8
pkgrel=1
pkgdesc="Molecular Evolutionary Genetics Analysis"
arch=('i686' 'x86_64')
url="http://www.megasoftware.net"
license=('custom')
depends=('gtk2' 'gconf' 'libxtst' 'nss' 'libxss' 'alsa-lib')
source=("https://www.megasoftware.net/do_force_download/megax_${pkgver}-1_amd64.deb"
        'MEGA_EUA.pdf::https://www.megasoftware.net/download_eua')
md5sums=('7083d62e933fd482aac50c98a13dd723'
         '82f225eaed3a512ca70af54fabaf6690')

package() {
	tar -p -xf data.tar.xz -C "${pkgdir}"
	chmod 755 -R ../pkg/${pkgname}/usr
	
	# namcap does not like local
	cp -rl ../pkg/${pkgname}/usr/local/* ../pkg/${pkgname}/usr/
	rm -r ../pkg/${pkgname}/usr/local
	
	install -Dm644 MEGA_EUA.pdf "$pkgdir/usr/share/licenses/$pkgname/MEGA_EUA.pdf"
}
