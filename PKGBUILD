# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=opera-beta
pkgver=31.0.1889.92
pkgrel=1
pkgdesc='A fast and secure web browser and Internet suite - beta stream'
arch=('x86_64')
url='http://www.opera.com/browser/'
license=('custom:opera')
depends=('alsa-lib' 'nss' 'gtk2' 'gconf' 'libxss' 'libxtst' 'desktop-file-utils')
install=opera.install
options=(!strip)
source=("http://get.geo.opera.com/pub/${pkgname}/${pkgver}/linux/${pkgname}_${pkgver}_amd64.deb")
# alternative download
#source=("ftp://ftp.opera.com/pub/${pkgname}/${pkgver}/linux/${pkgname}_${pkgver}_amd64.deb")
#source=("http://deb.opera.com/${pkgname}/pool/non-free/o/${pkgname}/${pkgname}_${pkgver}_amd64.deb")
sha256sums=('e5863aef9027fbdf57e23b563bf3cb8ec9c8e64a53f89e74a53e1b1a9f609179')

package() {
	cd ${srcdir}/

	# this is nested archive with final directory structure,
	# so extract the inner tarball to ${pkgdir}
	tar xJf data.tar.xz -C "${pkgdir}/"

	# set suid bit for Opera sandbox
	chmod 4755 "${pkgdir}/usr/lib/x86_64-linux-gnu/${pkgname}/opera_sandbox"
}

