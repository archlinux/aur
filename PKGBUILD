# Maintainer: MisterCh0c <mstrch0c@gmail.com>

pkgname=cloudfail-git
pkgver=0.9.3.r102.ge8ad02c
pkgrel=2
pkgdesc="Tactical reconnaissance tool which aims to gather enough information about a target protected by Cloudflare"
arch=('any')
url="https://github.com/m0rtem/CloudFail"
license=('GPL')
depends=('python')
makedepends=('python-pip')
provides=('cloudfail')
source=("cloudfail-git"::'git+https://github.com/m0rtem/CloudFail.git')
sha512sums=('SKIP')
options=('!strip')



package() {
	cd "$srcdir/$pkgname"
	pwd
	pip install -r requirements.txt 
	pip install PySocks 

	# Create an indirect launcher in /usr/bin
	install -Dm 755 "${srcdir}/$pkgname/cloudfail.py" "${pkgdir}/usr/bin/cloudfail"

	mkdir -p $pkgdir/usr/lib/python3.6/site-packages
	cp  $srcdir/$pkgname/DNSDumpsterAPI.py $pkgdir/usr/lib/python3.6/site-packages/DNSDumpsterAPI.py

}



