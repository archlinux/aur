# Maintainer: Sergey Morozov <12103270+v4n6@users.noreply.github.com>
_appname=copilot-language-server
pkgname=${_appname}-bin
pkgver=1.501.0
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
sha256sums_aarch64=('5876367208c929a037149026cd28aa1c2aebcdf64844d521f2c6e1536a7136c2')
sha256sums_x86_64=('90494a5d7482160627a58ad4258a618892cb532e7064dc6707f6265b3e79f9e8')
b2sums=('ddb0252f3de49c63f92963fdad8a31a0ff582380a66a2b76f136b09021e878c6c4bb7c6f2eb4fbb3135a38b7f4a47d2ded25a05069bd3d055d7c718775b7bf54')
b2sums_aarch64=('944e3f5fdf3a675baa6052ba7e031e3b6787416836bd0094cb4e7331f799e1546ccfbfb2d9e4f067dae9583b88ccdcd3a9f0cf6dedfe4f4f66b40ee74f85da42')
b2sums_x86_64=('f35f039957e2ccd01c674ace9156eca1a9753927691ff02393339d3f41824d3d0f6073061d11279f6192453b50e3695d3d919a35a60a9766ca8cc28051eb8949')

options=("!strip")

package() {
    install -Dm755 copilot-language-server -t "${pkgdir}/usr/bin"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_appname}"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_appname}"
}
