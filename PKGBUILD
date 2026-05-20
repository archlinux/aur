# Maintainer: Sergey Morozov <12103270+v4n6@users.noreply.github.com>
_appname=copilot-language-server
pkgname=${_appname}-bin
pkgver=1.490.0
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
sha256sums_aarch64=('3f991a79c803e5aaeb860236861210a39cdcde5fe2e71c24cdf7d87129fc3ef1')
sha256sums_x86_64=('52d357fbfa8ff0165a8d46ef991c5fd1fde0a119fc90c3e60f07ab8f4b8f6a2f')
b2sums=('ddb0252f3de49c63f92963fdad8a31a0ff582380a66a2b76f136b09021e878c6c4bb7c6f2eb4fbb3135a38b7f4a47d2ded25a05069bd3d055d7c718775b7bf54')
b2sums_aarch64=('341183f5db642d47771b57057c5d4ac7a99c3cea75cba2ba1ea71bfb28c931ec728146ec23b6f77eeff33979dd778d7bcc0703183083692cd5765d7e6279140f')
b2sums_x86_64=('cdf2bd2be2a63ad582017a8ac809a74462f99b05f2873270b3677c91df6c4016d3592a0e079613f936df8c2680e3cbce87185a4f2782c0f1de7fda14b34238eb')

options=("!strip")

package() {
    install -Dm755 copilot-language-server -t "${pkgdir}/usr/bin"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_appname}"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_appname}"
}
