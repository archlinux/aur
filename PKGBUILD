# Maintainer: Hauke Ingwersen <hauing@pm.me>
# Contributor: Robert Csordas <xdever@gmail.com>

pkgname=mutagen.io-bin
pkgver=0.16.2
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
sha256sums_x86_64=('802b7447f2dc533d8bf22d4cfe85eea81c7619b7ccb8e073a51f9f76c53272a7')
sha256sums_i386=('07d6fe23cd63330b071e2eace30514bda7250a8bf52cfba3ef3d02f4e9c18e21')
sha256sums_aarch64=('42bb682fe2fec5f6c6d4173a953b6776e8712a644e0832540e6bfbb1c46b284f')
sha256sums_arm7h=('bd131f827eb721afa2078e7cea02a6cd04dc24b225495b2e17e5dcf883f4d974')
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
