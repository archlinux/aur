# Maintainer: Hauke Ingwersen <hauing@pm.me>
# Contributor: Robert Csordas <xdever@gmail.com>

pkgname=mutagen.io-bin
pkgver=0.16.0
pkgrel=1
epoch=
arch=('i386' 'x86_64' 'aarch64' 'armv7h')
url="https://mutagen.io/"
changelog=
license=('MIT')
source_x86_64=("https://github.com/mutagen-io/mutagen/releases/download/v${pkgver}/mutagen_linux_amd64_v${pkgver}.tar.gz")
source_i386=("https://github.com/mutagen-io/mutagen/releases/download/v${pkgver}/mutagen_linux_386_v${pkgver}.tar.gz")
source_aarch64=("https://github.com/mutagen-io/mutagen/releases/download/v${pkgver}/mutagen_linux_arm64_v${pkgver}.tar.gz")
source_arm7h=("https://github.com/mutagen-io/mutagen/releases/download/v${pkgver}/mutagen_linux_arm_v${pkgver}.tar.gz")
sha256sums_x86_64=('146e4aed8c465504b2089550b2320f9c61184a73d2c495672928ab6c8bf24999')
sha256sums_i386=('5e5fd0343aa60d928d84960cfa95c6ebbd68f9ee8a207de8262fde6d7569f34e')
sha256sums_aarch64=('9f6270c4ca5dd11f90ae1b3fc067dece36ebc10581ff09fb5bcf6c2ee3f9e817')
sha256sums_arm7h=('87220bc9184e471f89bbb027a3b970e8cdeff9787f8fd2693a4f047194a45fac')
pkgdesc="Code synchronization tool for remote development."

prepare () {
    tar -xvf mutagen_linux_*_v${pkgver}.tar.gz
}

package () {
    install -D -m755 ${srcdir}/mutagen ${pkgdir}/opt/mutagen/mutagen
    install -D -m644 ${srcdir}/mutagen-agents.tar.gz ${pkgdir}/opt/mutagen/mutagen-agents.tar.gz
    mkdir -p  ${pkgdir}/usr/bin/
    ln -s /opt/mutagen/mutagen ${pkgdir}/usr/bin/
}
