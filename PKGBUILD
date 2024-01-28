# Maintainer: Mekyt <hello at mek dot yt>

_pkgname='rumqttd'
pkgname='rumqttd-bin'
pkgver=0.19.0
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
            '4e1b4f665fbd8e4bc2c13dded8c8724b445ce9626739e9cd048c8ab0eca041b7528815720962319548c09210e000eb3ce6ece9731b47be22a3c59e439791576d'
            '0d3de0db825bf165cc1cb69e2bec46bb409a5dc6ec79acf6b160ecc2f524d423c3de4fddd3f16dad9044620d5d5a01ba18158e1f772e898be4719d4fa817eb4c'
            '154b70de3d72646fa56a18caf9c431f886216b24bad8208125b69e2276115ab37ab89e89884963155d33747535652a56e28f389329db521545a1df31cfe6b10f')

package() {
    install -Dm755 ${_pkgname} -t "${pkgdir}"/usr/bin/
    install -Dm644 rumqtt.service -t "${pkgdir}"/usr/lib/systemd/system/
    install -Dm644 rumqtt.sysusers "${pkgdir}"/usr/lib/sysusers.d/rumqtt.conf
    install -Dm644 config.toml "${pkgdir}"/etc/rumqtt/config.toml
}
