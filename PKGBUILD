# Maintainer: Elrondo46 TuxnVape <elrond94@hotmail.com>

pkgname=docker-userspace
pkgver=1.1
pkgrel=1
pkgdesc="Docker in Username Space better isolation and security in case of file conflict you have to do it manually"
arch=('x86_64')
license=('GPL3')
url="https://www.tuxnvape.fr/"
depends=("docker")
install=docker-userspace.install
source=("https://github.com/Elrondo46/docker-userspace/archive/1.1.tar.gz")
sha256sums=('fa3b8b548c55fc366f41624ed17d9443a108471ccb93f86eaad5089942a01a19')

package() {
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/subuid" "${pkgdir}/etc/subuid"
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/subgid" "${pkgdir}/etc/subgid"
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/docker-userspace.service" "${pkgdir}/usr/lib/systemd/system/docker-userspace.service"
} 
