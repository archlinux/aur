# Maintainer:mistgc <georgecai0908@outlook.com>
pkgname=shimo
pkgver=3.7.1
pkgrel=1
pkgdesc="石墨文档 Shimo document (An online collaborative office software)."
arch=('x86_64' 'aarch64')
url="https://shimo.im/"
license=('custom')
depends=('nss' 'gtk3' 'libnotify' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret')
replaces=('shimo-bin')
source_x86_64=("https://oas.shimonote.com/panther/${pkgname}/release/linux/x64/${pkgname}_v${pkgver}-release.6d12f71.shimo_linux-amd64.deb")
source_aarch64=("https://oas.shimonote.com/panther/${pkgname}/release/linux/arm64/${pkgname}_v${pkgver}-release.6d12f71.shimo_linux-arm64.deb")
sha512sums_x86_64=('85adccd148d9ce0bcf708acd1d4b87990f0577496866a47a8fe0f3b38ac034a57e4381704dbc5921e5d6620700bcc725a26a574f2b89d1de21b9ec4b7c0b889f')
sha512sums_aarch64=('6c9190ac8040ca8bc0a5ba256e332ac36916ef06bf7805bd848e24e8eb014ebb253f5635ae0a377674248816b29c115be0e796c221813afb01b1fab58f527413')

package() {
    tar -xpf data.tar.gz -C "${pkgdir}"

    # Launcher
    mkdir -p "${pkgdir}/usr/bin/"
    ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    # License
    install -Dm644 "${pkgdir}/opt/shimo/LICENSE.electron.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 "${pkgdir}/opt/shimo/LICENSES.chromium.html" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
