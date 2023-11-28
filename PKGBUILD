# Maintainer: Gee
# Co-Maintainer: Leon Möller <jkhsjdhjs at totally dot rip>

pkgname="nzbhydra2-nojava-bin"
pkgver=5.3.5
pkgrel=1
pkgdesc="Search aggregator for newznab and torznab indexers."
arch=('x86_64' 'aarch64')
url="https://github.com/theotherp/nzbhydra2"
license=('Apache')
provides=('nzbhydra2')
conflicts=('nzbhydra2')
depends=('python')
optdepends=('jackett: torrent indexer proxy')

source=('nzbhydra2.service'
        'nzbhydra2.tmpfiles'
        'nzbhydra2.sysusers'
        'nzbhydra2.sh')
source_x86_64=("https://github.com/theotherp/nzbhydra2/releases/download/v${pkgver}/${pkgname%-nojava-bin}-${pkgver}-amd64-linux.zip")
source_aarch64=("https://github.com/theotherp/nzbhydra2/releases/download/v${pkgver}/${pkgname%-nojava-bin}-${pkgver}-arm64-linux.zip")

sha256sums=('2fae64a1c5979d9f7b508f1e15d0f013b7cca1f2bbbdae56f546f4c362146b68'
            'a9ceeed2b50d55c5e554c0d4c615e855fe4d3889eb118e37908fa04ffb7cb003'
            '8f91eb4f98f7f5c11590b29b1394dfa7ca62ad115feeac4f402c9ac094fb925a'
            'd1c40c40c1ec75d37e8dec0b250179f6a88fedb49ad335ae53625e159a730019')
sha256sums_x86_64=('1d79c21cc9a02cd64beec404642b1cd9606e5a81f38cbef0d6ff86258742c4ba')
sha256sums_aarch64=('83c604a5600820ce23502ae56a22e64512d7cde5e4ed9294efef695b4dff7369')

package() {
    install -D -m 755 "${srcdir}/nzbhydra2.sh" "${pkgdir}/usr/bin/nzbhydra2"
    install -D -m 755 "${srcdir}/nzbhydra2wrapperPy3.py" "${pkgdir}/usr/lib/nzbhydra2/nzbhydra2wrapperPy3.py"
    install -D -m 755 "${srcdir}/core" "${pkgdir}/usr/lib/nzbhydra2/core"
    install -D -m 644 "${srcdir}/readme.md" "${pkgdir}/usr/share/doc/nzbhydra2/readme.md"

    install -D -m 644 "${srcdir}/nzbhydra2.service" "${pkgdir}/usr/lib/systemd/system/nzbhydra2.service"
    install -D -m 644 "${srcdir}/nzbhydra2.sysusers" "${pkgdir}/usr/lib/sysusers.d/nzbhydra2.conf"
    install -D -m 644 "${srcdir}/nzbhydra2.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/nzbhydra2.conf"
}
