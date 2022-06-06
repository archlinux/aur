# Maintainer 2021: Nadya <nadyushka228@riseup.net>
# Maintainer 2022-: spyophobia <76800505+spyophobia@users.noreply.github.com>
pkgname=cloak-obfuscation-bin
pkgver=2.6.0
pkgrel=1
pkgdesc='A pluggable transport that works alongside traditional proxy tools like OpenVPN to evade deep-packet-inspection based censorship'
arch=('x86_64' 'arm' 'aarch64')
url='https://github.com/cbeuw/Cloak'
license=('GPL3')
conflicts=("cloak-obfuscation" "cloak-obfuscation-git")
source=("cloak-obfuscation-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
source_x86_64=(
    "${url}/releases/download/v${pkgver}/ck-client-linux-amd64-v${pkgver}"
    "${url}/releases/download/v${pkgver}/ck-server-linux-amd64-v${pkgver}"
)
source_arm=(
    "${url}/releases/download/v${pkgver}/ck-client-linux-arm-v${pkgver}"
    "${url}/releases/download/v${pkgver}/ck-server-linux-arm-v${pkgver}"
)
source_aarch64=(
    "${url}/releases/download/v${pkgver}/ck-client-linux-arm64-v${pkgver}"
    "${url}/releases/download/v${pkgver}/ck-server-linux-arm64-v${pkgver}"
)

sha512sums=('cbb73e87b94ed63603b550ad8e0596865f8547c36f109f0d1e6ca31b9c522571c9f2ac8c2f6caa006a12b3f2126a313c1b2448f57ed9dcf5804f7e2bc8717b60')
sha512sums_x86_64=(
    'ecdc69b877fe49a635e1a821a8ca410f1ed488c075a679382ef9e7df6fba2239e43cb72cf2cb24340496f0a30bc82dabbd538f46713ad8abf31c21866f05854c'
    '35fc85097f2d63e5bb22de39bb6e83bc8459b4b7b8a902a19e3a37876009e425e891ff16a6597867647ed772c281171861bfbc94eafaa50bcd52886ca18d862d'
)
sha512sums_arm=(
    '91b338659e587b3434ba8120d2f1b9f2ec9df7d64a663d1e620c01b60eb9718efbb91f2aec0b413d432efc966b8f22ba26f1aaec3c09a43b945d65f62cc1248a'
    'f4d1a211e6c36f91f214c0d2461e8b6fd55bf9f68ffb427b9343a8322e2241f2e8bff588a473dbacf0e5ef0653854635f4777a6595e6d2c5fa8d6375fa312762'
)
sha512sums_aarch64=(
    '1a10cf8d8422e7ebfeb7380918277ff4ea885e0b523439caf56279954e93558441c978406be5c7807ed2ab4ef3f3917e5040d5affcdb8f498837f127bf76c400'
    '1dea371d7d6c761584752e5bb37ed4801c5774ad6e9a2111dfcbe1d14e56c6df8bf41bb82c350191a1d409200897b52cf4f0040ddc2f003ba6ebf46bba86d174'
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
