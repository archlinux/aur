# Maintainer: Sergey Morozov <12103270+v4n6@users.noreply.github.com>
_appname=copilot-language-server
pkgname=${_appname}-bin
pkgver=1.548.0
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
sha256sums_aarch64=('8cc5613aa6e65217a921d8c7deba7325b89f550f571ccde9d73a46af2ab5dc36')
sha256sums_x86_64=('a51d719a02de202a36bc97ef5478bc3564e909f4ebd33b4da823f71adeaad5bb')
b2sums=('ddb0252f3de49c63f92963fdad8a31a0ff582380a66a2b76f136b09021e878c6c4bb7c6f2eb4fbb3135a38b7f4a47d2ded25a05069bd3d055d7c718775b7bf54')
b2sums_aarch64=('e411679414b485d52038af49c17c5a8c8c5c150036694c6fdc0880a798950ce166c785e3b7527fe290ad9e6a77bdac1908fd2797bee952ea9a56527facdcd96f')
b2sums_x86_64=('d0d7a7cc403d67925b1ad7be7b03f960f25487daf38ab7cef57911d2bcc16d894ae1aa82eb3a6270be6e6f47fc43703ca7a2532459bd04278b48f0bd9d42e376')

options=("!strip")

package() {
    install -Dm755 copilot-language-server -t "${pkgdir}/usr/bin"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_appname}"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_appname}"
}
