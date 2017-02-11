# Maintainer: Flow

pkgname=svfs
pkgver=0.9.1
pkgrel=2
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
sha512sums_i686=('8d35cbcea4476a07d12ddb8503ce62006a7e5e3264324f11865ba23d49ea9aa61f0b91bf0168ef1118f22c974c9affda4901f05f064a51e5c1e69aeb39105214')
sha512sums_x86_64=('a0af81e5bcd6fe877ad092bdcd84993eb8aad3d29f8181ab8f093c214516b1dddb9a9225f0718a58a7792e44a20a54c489ebe0341205ca79b8b10e51d174be06')
sha512sums_arm=('854089c51c58e051ce340fb18a032b0a326e52f044a4466ddc92ecaa22623ec92b187366b84b8915902f01cc115971d9714345e5b47ff497c311a2f84c94dadd')
sha512sums_armv6h=('854089c51c58e051ce340fb18a032b0a326e52f044a4466ddc92ecaa22623ec92b187366b84b8915902f01cc115971d9714345e5b47ff497c311a2f84c94dadd')
sha512sums_armv7h=('f6b53dbb424c9cae2fa0bcb258b778efe3a35e2c4473802870540492adbeffb6e5dea224da4c99cc286e9885f385e501652c4b2a5122898c8a19a926ed67eb2c')

package() {  
    cd "${srcdir}"
	tar -xzf data.tar.gz -C "${srcdir}"
    install -Dm755 "${srcdir}"/usr/local/bin/hubic-application "${pkgdir}"/usr/bin/hubic-application
    install -Dm755 "${srcdir}"/usr/local/bin/svfs "${pkgdir}"/usr/bin/svfs
    install -Dm755 "${srcdir}"/sbin/mount.svfs "${pkgdir}"/usr/bin/mount.svfs
}
