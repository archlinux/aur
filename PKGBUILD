# Maintainer: Flow

pkgname=svfs
pkgver=0.8.2
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
md5sums_i686=('89f6b95de82c3e3c96fd597186bb957e')
md5sums_x86_64=('936c4ae60c6003451786a68681b627eb')
md5sums_arm=('3633a687ae1ee51eda2018f5ba5d1776')
md5sums_armv6h=('3633a687ae1ee51eda2018f5ba5d1776')
md5sums_armv7h=('086b5b23b02eab5ad5776e58ef228f0d')

package() {  
    cd "${srcdir}"
	tar -xzf data.tar.gz -C "${srcdir}"
    install -Dm755 "${srcdir}"/usr/local/bin/hubic-application "${pkgdir}"/usr/bin/hubic-application
    install -Dm755 "${srcdir}"/usr/local/bin/svfs "${pkgdir}"/usr/bin/svfs
    install -Dm755 "${srcdir}"/sbin/mount.svfs "${pkgdir}"/usr/bin/mount.svfs
}
