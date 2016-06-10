# Maintainer: Flow

pkgname=svfs
pkgver=0.7.0
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
source_armv7h=("https://github.com/ovh/svfs/releases/download/v${pkgver}/${pkgname}_${pkgver}_armel.deb")
source_x86_64=("https://github.com/ovh/svfs/releases/download/v${pkgver}/${pkgname}_${pkgver}_amd64.deb")
source_i686=("https://github.com/ovh/svfs/releases/download/v${pkgver}/${pkgname}_${pkgver}_386.deb")
md5sums_i686=('47c446eaa1afc70c5185178190cc48e6')
md5sums_x86_64=('d602f527c74975c52059ee939aa11678')
md5sums_arm=('8c2ea8e68ace9ea2b321d63cc324f975')
md5sums_armv6h=('8c2ea8e68ace9ea2b321d63cc324f975')
md5sums_armv7h=('8c2ea8e68ace9ea2b321d63cc324f975')


package() {  
    cd "${srcdir}"
	tar -xzf data.tar.gz -C "${srcdir}"
    install -Dm755 "${srcdir}"/usr/local/bin/hubic-application "${pkgdir}"/usr/bin/hubic-application
    install -Dm755 "${srcdir}"/usr/local/bin/svfs "${pkgdir}"/usr/bin/svfs
    install -Dm755 "${srcdir}"/sbin/mount.svfs "${pkgdir}"/usr/bin/mount.svfs
}
