# Maintainer: Flow

pkgname=svfs
pkgver=0.7.4
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
md5sums_i686=('2236720f4a4222110307cb43e16cf6cd')
md5sums_x86_64=('b812a2aba12a9391d51dd7e7ab3b4d69')
md5sums_arm=('e6ec17e77902a6daf5e85eb94fa00ba6')
md5sums_armv6h=('e6ec17e77902a6daf5e85eb94fa00ba6')
md5sums_armv7h=('e6ec17e77902a6daf5e85eb94fa00ba6')

package() {  
    cd "${srcdir}"
	tar -xzf data.tar.gz -C "${srcdir}"
    install -Dm755 "${srcdir}"/usr/local/bin/hubic-application "${pkgdir}"/usr/bin/hubic-application
    install -Dm755 "${srcdir}"/usr/local/bin/svfs "${pkgdir}"/usr/bin/svfs
    install -Dm755 "${srcdir}"/sbin/mount.svfs "${pkgdir}"/usr/bin/mount.svfs
}
