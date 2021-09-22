# Maintainer: <user11681 at gmail dot com>
pkgname=fabric-installer
pkgver=0.7.4
pkgrel=4
pkgdesc='installer for the Minecraft mod loader Fabric'
arch=('any')
url='https://fabricmc.net'
license=('Apache-2.0')
depends=('java-environment>=8')
source=("https://maven.fabricmc.net/net/fabricmc/fabric-installer/${pkgver}/fabric-installer-${pkgver}.jar")
sha256sums=('192d60fb544a45edca589a4f73d9d3df93a7f7b68a407c0403e9e1802faf7668')

package() {
    _filename="${pkgname}-${pkgver}.jar"
    _installer="/usr/share/fabric-installer/${_filename}"
    _bin="${pkgdir}/usr/bin"
    _run="${_bin}/fabric-installer"

    install -Dm 644 $_filename "${pkgdir}/${_installer}"
    mkdir -p "$_bin" && echo java -jar $_installer '$*' > "$_run"
    chmod 755 "$_run"
}

