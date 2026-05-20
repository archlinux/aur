# Maintainer: Sergey Morozov <12103270+v4n6@users.noreply.github.com>
_appname=copilot-language-server
pkgname=${_appname}-bin
pkgver=1.491.0
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
sha256sums_aarch64=('eea94f1e1bef6f1bf5f39a96c93e0a069eef06e55180fc07f221e04e28a2d280')
sha256sums_x86_64=('aa16a97d1d476346398534720c7d3f6fbbc344dcc8c3dede99bc4276670cbe11')
b2sums=('ddb0252f3de49c63f92963fdad8a31a0ff582380a66a2b76f136b09021e878c6c4bb7c6f2eb4fbb3135a38b7f4a47d2ded25a05069bd3d055d7c718775b7bf54')
b2sums_aarch64=('a6a0095cd4b475ce8c0b12b9dd532cdf5942594ae1cffb898c468d92f88492c3eada98fcbf73a0aa3eb1aa6a3a4af618424671714f5089a4c15887171e61d0fd')
b2sums_x86_64=('029f8886f31b9436f32364e523ba8f7cb9b55dfdb72b8b13205f1e612ef4a0092a3d323eaf1cd0f3c2eb3c67f58058b6396fcca91f2513a78960563306c085cc')

options=("!strip")

package() {
    install -Dm755 copilot-language-server -t "${pkgdir}/usr/bin"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_appname}"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_appname}"
}
