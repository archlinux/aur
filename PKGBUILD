# Maintainer: Flow

pkgname=svfs
pkgver=0.9.0
pkgrel=1
pkgdesc="The Swift Virtual File System for hubiC (ovh)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
conflicts=("svfs-git")
provides=("svfs")
url='https://github.com/ovh/svfs'
license=('BSD')
depends=('fuse' 'ruby')
makedepends=()
source_arm=("https://github.com/ovh/svfs/releases/download/v${pkgver}/${pkgname}_${pkgver}_armel.deb")
source_armv6h=("https://github.com/ovh/svfs/releases/download/v${pkgver}/${pkgname}_${pkgver}_armel.deb")
source_armv7h=("https://github.com/ovh/svfs/releases/download/v${pkgver}/${pkgname}_${pkgver}_armhf.deb")
source_x86_64=("https://github.com/ovh/svfs/releases/download/v${pkgver}/${pkgname}_${pkgver}_amd64.deb")
source_i686=("https://github.com/ovh/svfs/releases/download/v${pkgver}/${pkgname}_${pkgver}_i386.deb")
md5sums_i686=('32a7b8a55845bf36b7d4f3ac08da5519')
md5sums_x86_64=('6442e664408a3681b90f3ff123d93d53')
md5sums_arm=('bb1505303d6b69bb620b851028f8fa3f')
md5sums_armv6h=('bb1505303d6b69bb620b851028f8fa3f')
md5sums_armv7h=('be4de18a38d8ed4c17e27a82ccec1741')

package() {  
    cd "${srcdir}"
	tar -xzf data.tar.gz -C "${srcdir}"
    install -Dm755 "${srcdir}"/usr/local/bin/hubic-application "${pkgdir}"/usr/bin/hubic-application
    install -Dm755 "${srcdir}"/usr/local/bin/svfs "${pkgdir}"/usr/bin/svfs
    install -Dm755 "${srcdir}"/sbin/mount.svfs "${pkgdir}"/usr/bin/mount.svfs
}
