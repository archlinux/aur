# Maintainer: Merrick Luo <merrick@luois.me>
pkgname=iease-music
pkgver=1.0.1
pkgrel=0
pkgdesc='Elegant neteaseMusic desktop app, Rock with NeteaseMusic.'
arch=('x86_64')
url='https://github.com/trazyn/ieaseMusic'
license=('MIT')
_rpmname="ieaseMusic-${pkgver}-linux-x86_64.rpm"
depends=('libxtst' 'gtk2' 'gconf' 'libxss' 'nss' 'python' 'alsa-lib' 'java-environment')
makedepends=('rpmextract')
options=()
source=("https://github.com/trazyn/ieaseMusic/releases/download/v${pkgver}/${_rpmname}")
md5sums=('bb6ece3aa012814d927efb9b3d2fa04d')

build() {
  cd "${srcdir}"
  rpmextract.sh ../${_rpmname}
}

package() {
	cp -r ${srcdir}/opt ${pkgdir}/
	cp -r ${srcdir}/usr ${pkgdir}/
	mkdir -p ${pkgdir}/usr/bin/
	ln -s /opt/ieaseMusic/iease-music ${pkgdir}/usr/bin/
}
