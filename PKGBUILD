# Maintainer: AkinoKaede <autmaple@protonmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: pandada8 <pandada8@gmail.com>

pkgname=xray-bin
pkgver=1.1.4
pkgrel=1
pkgdesc="The best v2ray-core, with XTLS support."
arch=('x86_64')
url="https://github.com/XTLS/Xray-core"
license=('MPLv2')
depends=('glibc' 'v2ray-domain-list-community' 'v2ray-geoip')
backup=(etc/xray/config.json)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/Xray-linux-64.zip"
    "config.json"
    "vpoint_socks_vmess.json"
    "vpoint_vmess_freedom.json"
    "xray.service"
    "xray@.service"
)
sha512sums=(
    '90ce62216195b3d2e7ca9f0fe1f1562cec06d14c76af550821e6327f19b5e4d1b329660f15bcdc244713822960a743e92c21a6354f70056ff037adabb8d6bb0b'
    '2000211cbf987adaee7f278cc8cb23268965caab3bc46401f9324f2beaad95bec11012f5f4500f1016f4b75f097f3ac96cc5be2da7a6df0261582b3f23b3d78d'
    '9914fd3da02511b716951e521ca22006a6e8ad66e64d32cc7dd7dc3544a754174b37e35df6108ca217130f02763265d74f8bc56c4e52b262bdd48dcdb5310eb5'
    '532f66fe19196de0cc43df1812d6f32cbca7bbcacaa0cd4141bd80b3121b17eb8b23e0464765cf05a97b11e0213fb688eade83e393e36b3e7ebded6f0925de97'
    'f5ea93fab3a108ee30bbf9ac6f611df0397809f0c63c6bdb79dde60a49c3be175b4c915bd4d26313fbd2703b73f3a28f3e158352c521d1173baac219df73300d'
    '7c96cbea8d8e34d2458c3aeb31b03e9f322e3774193e0458f003f2336c7ff39b65a94840942f09b7c5e96287c74cdd8b7b96717e38ff230161ad887d34a86d8f'
)

package() {
    cd "${srcdir}"
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/xray/LICENSE
    install -Dm644 xray.service "${pkgdir}"/usr/lib/systemd/system/xray.service
    install -Dm644 xray@.service "${pkgdir}"/usr/lib/systemd/system/xray@.service
    install -Dm644 *.json -t "${pkgdir}"/etc/xray/
    install -Dm755 xray -t "${pkgdir}"/usr/bin/
}
