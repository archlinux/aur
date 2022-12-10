# Maintainer: Hauke Ingwersen <hauing@pm.me>
# Contributor: Robert Csordas <xdever@gmail.com>

pkgname=mutagen.io-bin
pkgver=0.16.3
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
sha256sums_x86_64=('fce3c9027f7ddca38068d146c37ef86610849a77ae0f32c746586c5fc60e6545')
sha256sums_i386=('8472d96ae77a48703579d916d53a71879b35fcd8906c9c1ca493395f3a75a5b8')
sha256sums_aarch64=('7dc8ea368f9bccf1d656ab7fb9ccca56c8e695670d85521526410fac5dcfc3b1')
sha256sums_arm7h=('e6b0f16f2e60544f5b1be92d5fe5d68f028f5b7e9406cf16f48823cd3d242cc2')
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
