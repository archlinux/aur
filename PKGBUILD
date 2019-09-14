# Maintainer: Elrondo46 TuxnVape <elrond94@hotmail.com>

pkgname=docker-userspace
pkgver=1.1
pkgrel=2
pkgdesc="Docker in Username Space better isolation and security in case of file conflict you have to do it manually"
arch=('x86_64')
license=('GPL3')
url="https://www.tuxnvape.fr/"
depends=("docker")
install=docker-userspace.install
source=("https://github.com/Elrondo46/docker-userspace/archive/1.1.tar.gz")
sha256sums=('fb9d91c634a080b5e7b7cfca2b69761a94f6a0b2e5082eca022a667fca81e540')

package() {
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/subuid" "${pkgdir}/etc/subuid"
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/subgid" "${pkgdir}/etc/subgid"
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/docker-userspace.service" "${pkgdir}/usr/lib/systemd/system/docker-userspace.service"
} 
