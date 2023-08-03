# Maintainer: Mekyt <hello at mek dot yt>

_pkgname='rumqttd'
pkgname='rumqttd-bin'
pkgver=0.16.0
pkgrel=1
pkgdesc='A high performance, embeddable MQTT broker'
arch=('x86_64')
url='https://github.com/bytebeamio/rumqtt'
license=('Apache 2.0')
depends=()
makedepends=()
optdepends=()
source=(
    'config.toml'
    "${_pkgname}::${url}/releases/download/${_pkgname}-${pkgver}/${_pkgname}-${pkgver}-linux-gnu"
    "rumqtt.service"
    "rumqtt.sysusers"
)
backup=('etc/rumqtt/config.toml')
sha512sums=('af634f9ca0e26a8cd2acfcf53fd29e0d37fd67c21bccf7e52c10f302b83708f1d953dfccaccfd7250d6f156c6ea233ff4f5c3afb6842d18e50af39fc948496f3'
            '5119cc8c16f33920d3354b9fbdbab521a400d5d65001cd82d3a3f7787d84a1af8f08ca5e9e03639b9a950b31efb59c66b50e3f2b8868ced2031ee0959c60fe42'
            '7723d132da5b75d1838d987ff6cea44a0549544196b61a16886f084f5e6c5b08c14c3a8a5f4af5da0cb42d63df491253e51df1c576a16858c3c9c78fb641a19c'
            '154b70de3d72646fa56a18caf9c431f886216b24bad8208125b69e2276115ab37ab89e89884963155d33747535652a56e28f389329db521545a1df31cfe6b10f')

package() {
    install -Dm755 ${_pkgname} -t "${pkgdir}"/usr/bin/
    install -Dm644 rumqtt.service -t "${pkgdir}"/usr/lib/systemd/system/
    install -Dm644 rumqtt.sysusers "${pkgdir}"/usr/lib/sysusers.d/rumqtt.conf
    install -Dm644 config.toml "${pkgdir}"/etc/rumqtt/config.toml
}
