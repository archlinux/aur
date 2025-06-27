# Maintainer: devome <evinedeng@hotmail.com>
# Contributor: tarball <bootctl@gmail.com>
# Contributor: Karol Babioch <karol@babioch.de

pkgname=tika-server
pkgver=3.2.0
pkgrel=1
pkgdesc="Detects and extracts metadata and text from over a thousand different file types, such as PPT, XLS, and PDF. (server)"
arch=('any')
url="https://${pkgname}.apache.org"
license=('Apache-2.0')
backup=("etc/default/${pkgname}")
depends=('java-runtime-headless')
    source=("${pkgname}-${pkgver}.jar::https://dlcdn.apache.org/tika/${pkgver}/${pkgname}-standard-${pkgver}.jar"
        "${pkgname}.env"
        "${pkgname}.service")
sha256sums=('60cc16fc933ee47f94e9f4a56e8d6f9554e0caf14facf896d9727b1e834224c1'
            'de1829782fc698b1be42fdb850ea3d9dd1d750bf37d4ab98a8ed5d43157cdeac'
            '00ad2023fe47bb77b78c4be364973c21ef8961a51cfa8b4f5ef910ee32542837')
noextract=("${pkgname}-${pkgver}.jar")

package() {
    install -Dm644 "${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}.jar"
    install -Dm644 "${pkgname}.env"           "${pkgdir}/etc/default/${pkgname}"
    install -Dm644 "${pkgname}.service"       "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}

