# Maintainer: Jim Driessen <aur@driessen.li>
# Contributor: Hauke Ingwersen <hauing@pm.me>
# Contributor: Robert Csordas <xdever@gmail.com>

pkgname=mutagen.io-bin
pkgver=0.18.0
pkgrel=1
epoch=
arch=('i386' 'x86_64' 'aarch64' 'armv7h')
url="https://mutagen.io/"
changelog=
license=('MIT')
source_x86_64=("https://github.com/mutagen-io/mutagen/releases/download/v${pkgver}/mutagen_linux_amd64_v${pkgver}.tar.gz")
source_i386=("https://github.com/mutagen-io/mutagen/releases/download/v${pkgver}/mutagen_linux_386_v${pkgver}.tar.gz")
source_aarch64=("https://github.com/mutagen-io/mutagen/releases/download/v${pkgver}/mutagen_linux_arm64_v${pkgver}.tar.gz")
source_armv7h=("https://github.com/mutagen-io/mutagen/releases/download/v${pkgver}/mutagen_linux_arm_v${pkgver}.tar.gz")
sha256sums_i386=('2ea484902ba5ddf4efb10a0f28ae416356ad7a22bf2a626da288342c5c55c83b')
sha256sums_x86_64=('c82bde0ecd3810650087a8fd99e8baf4a3119b85a9cb14155a0d9209600374d4')
sha256sums_aarch64=('c1621eede2cd9d36cd98d3fa419c843ecc1fb27e854103c754fcad50f4f4bb02')
sha256sums_armv7h=('bf65778a3fcf87f4bd02a8b6af1f723edd325b078f1924c1b109dd3fa7bcd19d')
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
