# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=opera-beta
pkgver=31.0.1889.98
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
sha256sums=('95ab02349b3c6a609b778a268c4d31f25fd0cfd7dfa0d255a85ea46fdbfdfcab')

package() {
	cd ${srcdir}/

	# this is nested archive with final directory structure,
	# so extract the inner tarball to ${pkgdir}
	tar xJf data.tar.xz -C "${pkgdir}/"

	# set suid bit for Opera sandbox
	chmod 4755 "${pkgdir}/usr/lib/x86_64-linux-gnu/${pkgname}/opera_sandbox"
}

