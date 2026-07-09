# Maintainer: Sergey Morozov <12103270+v4n6@users.noreply.github.com>
_appname=copilot-language-server
pkgname=${_appname}-bin
pkgver=1.520.0
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
sha256sums_aarch64=('b7684c902deb7b7d3b7a4434a2b4b24aa8cc0c306a1e27216769068be480a717')
sha256sums_x86_64=('c838b311a49aa4fdcacf1c74c900b568faaff32fabfdcced0ae9c5adea552876')
b2sums=('ddb0252f3de49c63f92963fdad8a31a0ff582380a66a2b76f136b09021e878c6c4bb7c6f2eb4fbb3135a38b7f4a47d2ded25a05069bd3d055d7c718775b7bf54')
b2sums_aarch64=('7b9a6f80dfd2891652d8f34eb8e1722f56bb94aa02aa69d1df738a256485fd078537bbbe7a317a6772fb7c64270fa3d72b4eec8153bb67e828c3ea6a591df52a')
b2sums_x86_64=('ce4c194d1b1b66a6cc08a0dac8be1703ada65a6d2ae222cc3672fa5307595a62e672abe8f3cf6f5cb832e85eeb8ccb66a36d5dd1f889f33c5cec6acb96244050')

options=("!strip")

package() {
    install -Dm755 copilot-language-server -t "${pkgdir}/usr/bin"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_appname}"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_appname}"
}
