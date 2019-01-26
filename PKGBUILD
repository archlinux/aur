# Maintainer: Elrondo46 TuxnVape <elrond94@hotmail.com>

pkgname=docker-userspace
pkgver=1.0
pkgrel=1
pkgdesc="Docker in Username Space better isolation and security in case of file conflict you have to do it manually"
arch=('x86_64')
license=('GPL3')
url="https://www.tuxnvape.fr/"
depends=("docker")
install=docker-userspace.install
source=("subuid"
        "subgid"
        "docker-userspace.service")

sha256sums=('1eea5693d1ab5ad1d39440085ccea344b54da3a3a1826c91d9153b305d648c14'
            '1eea5693d1ab5ad1d39440085ccea344b54da3a3a1826c91d9153b305d648c14'
            'd1e98c9c250c5f7b42e4f824ecdca45fab557f6cce1bc00ce3c7cbc6aea998fa')

package() {
        install -Dm644 "subuid" "${pkgdir}/etc/subuid"
        install -Dm644 "subgid" "${pkgdir}/etc/subgid"
        install -Dm644 "docker-userspace.service" "${pkgdir}/usr/lib/systemd/system/docker-userspace.service"
} 
