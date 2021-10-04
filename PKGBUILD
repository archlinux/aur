# Maintainer: <user11681 at gmail dot com>
pkgname=fabric-installer
pkgver=0.8.0
pkgrel=1
pkgdesc='installer for the Minecraft mod loader Fabric'
arch=('any')
url='https://fabricmc.net'
license=('Apache-2.0')
depends=('java-environment>=8')
source=("https://maven.fabricmc.net/net/fabricmc/fabric-installer/${pkgver}/fabric-installer-${pkgver}.jar")
sha256sums=('9ff97d46e058fb036a9aa1e93882f48fe503d4a16438cc75370aa31813903f0d')

package() {
    _filename="${pkgname}-${pkgver}.jar"
    _installer="/usr/share/fabric-installer/${_filename}"
    _bin="${pkgdir}/usr/bin"
    _run="${_bin}/fabric-installer"

    install -Dm 644 $_filename "${pkgdir}/${_installer}"
    mkdir -p "$_bin" && echo java -jar $_installer '$*' > "$_run"
    chmod 755 "$_run"
}

