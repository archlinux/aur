# Maintainer 2021: Nadya <nadyushka228@riseup.net>
# Maintainer 2022-: spyophobia <76800505+spyophobia@users.noreply.github.com>
pkgname=cloak-obfuscation-bin
pkgver=2.5.2
pkgrel=1
pkgdesc='A pluggable transport that works alongside traditional proxy tools like OpenVPN to evade deep-packet-inspection based censorship'
arch=('x86_64')
url='https://github.com/cbeuw/Cloak'
license=('GPL3')
conflicts=("cloak-obfuscation" "cloak-obfuscation-git")
source=(
    "${url}/releases/download/v${pkgver}/ck-client-linux-amd64-v${pkgver}"
    "${url}/releases/download/v${pkgver}/ck-server-linux-amd64-v${pkgver}"
    "${url}/archive/v${pkgver}.tar.gz"
)
sha512sums=(
    'd2b6d91d4cd49470096773824783d9b2f017dcfe5e647ee8165a4495b3f62d7e03d4dc84671a014e3cf0c13b0fe39240545045dc4bf7bb4bce47189d693120d2'
    '8daf98edcd611bf248cb3ea32cb44d2dc0d3ad31bfbbcc70b7fa25a10c6def1e07b51627a53ec8f477015d43ec3ce2c93a21638ad53f6a52909e594171a4d5d5'
    'f75ca585cd2aabfd2a3cd9c66686876ce8c1d58677d16053bf5e7c66e48068d6d73377313f9d67faa1c4ffef81e8f37754c275ea530a12df7f5b5de8dca71de1'
)
backup=(
    'etc/cloak/ckclient.json'
    'etc/cloak/ckserver.json'
)

package() {
    cd "${srcdir}"
    install -Dm 755 "ck-client-linux-amd64-v${pkgver}" "${pkgdir}/usr/bin/ck-client"
    install -Dm 755 "ck-server-linux-amd64-v${pkgver}" "${pkgdir}/usr/bin/ck-server"

    cd "${srcdir}/Cloak-${pkgver}/example_config"
    install -Dm 644 -t "${pkgdir}/etc/cloak" ckclient.json ckserver.json
}
