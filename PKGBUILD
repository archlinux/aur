# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

pkgname=obs-ndi-bin
_pkgname=obs-ndi
pkgver=4.9.1
pkgrel=1
_pkgrel=1
pkgdesc="Network A/V in OBS Studio with NewTek's NDI technology"
arch=('x86_64')
license=('GPL2')
url="https://github.com/Palakis/${_pkgname}"
provides=('obs-ndi')
conflicts=('obs-ndi-git')
depends=('obs-studio' 'avahi' 'libndi')
source=("${url}/releases/download/${pkgver}/obs-ndi_${pkgver}-${_pkgrel}_amd64.deb")
sha256sums=('e91a27370dcbee0879fb27ffec8dba149825f47909a92e31a001e87e64e7329b')

prepare() {
    cd ${srcdir}

    mkdir -p ${pkgname}
    tar -xJf data.tar.xz -C ${pkgname}

    chmod 755 $(find ${pkgname} -type d)
}

package() {
	cd ${srcdir}

	cp -a ${pkgname}/. ${pkgdir}
}
