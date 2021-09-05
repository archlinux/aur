# Maintainer: <user11681 at gmail dot com>

pkgname=fabric-installer
pkgver=0.7.4
pkgrel=3
pkgdesc='installer for the Minecraft mod loader Fabric'
arch=('any')
url='https://fabricmc.net'
license=('Apache-2.0')
depends=('java-environment>=8')
source=('https://maven.fabricmc.net/net/fabricmc/fabric-installer/0.7.4/fabric-installer-0.7.4.jar')
sha512sums=('e45db22eced9688f2a4ba3633718abd968686392615124a62a875d00b1e71d88f541a3c0e3eea6be4a3825c17a403f5816d17fb2c51e5e27087d0a40d0d1a096')

package() {
    _filename="${pkgname}-${pkgver}.jar"
    _installer="/usr/share/fabric-installer/${_filename}"
    _bin="${pkgdir}/usr/bin"
    _run="${_bin}/fabric-installer"

    install -Dm 644 $_filename "${pkgdir}/${_installer}"
    mkdir -p "$_bin" && echo java -jar $_installer '$*' > "$_run"
    chmod 755 "$_run"
}

