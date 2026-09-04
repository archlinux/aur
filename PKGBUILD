# Maintainer: Sergey Morozov <12103270+v4n6@users.noreply.github.com>
_appname=copilot-language-server
pkgname=${_appname}-bin
pkgver=1.540.0
epoch=1
pkgrel=1

pkgdesc="Language server that enables an IDE to integrate with GitHub Copilot."

arch=('aarch64' 'x86_64')
url="https://www.npmjs.com/package/@github/${_appname}"

license=('MIT')

source=("https://raw.githubusercontent.com/github/copilot-language-server-release/refs/tags/${pkgver}/LICENSE")
source_aarch64=("https://github.com/github/copilot-language-server-release/releases/download/${pkgver}/${_appname}-linux-arm64-${pkgver}.zip")
source_x86_64=("https://github.com/github/copilot-language-server-release/releases/download/${pkgver}/${_appname}-linux-x64-${pkgver}.zip")
sha256sums=('9e48ecfa18e2b15169746a3c97beda4d1d6c6796097038498ca434ca7e0ccd44')
sha256sums_aarch64=('01fbf2bd056c4cf8d1d3051f7e7d64945e1dca7f8fb7271f9a04d3fd46e6f47f')
sha256sums_x86_64=('2fa2b32e62ba09ccdbaa66fbdc8b7fe7d6a1ba1cbb865f0e7e9677ce6c3856f7')
b2sums=('ddb0252f3de49c63f92963fdad8a31a0ff582380a66a2b76f136b09021e878c6c4bb7c6f2eb4fbb3135a38b7f4a47d2ded25a05069bd3d055d7c718775b7bf54')
b2sums_aarch64=('ae0529795c30eda2024855b2e8d6edcfab44218a9361c0232978f9f21dda4c79f0a212cbf252b3fbf9a8e9d69ae901c3a289fe8a55ce21285ea9d0234131e3c0')
b2sums_x86_64=('c5c9c19bfb53b87dfc1a73bcd30a89e8d1f0ffc9cb9fda2f2d85170d4f63fc07495593e062c8aac78a77e52bbf41ee0e7f373467ce097812378d27efeccbb791')

options=("!strip")

package() {
    install -Dm755 copilot-language-server -t "${pkgdir}/usr/bin"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_appname}"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_appname}"
}
