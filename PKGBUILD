# Maintainer: Sergey Morozov <12103270+v4n6@users.noreply.github.com>
_appname=copilot-language-server
pkgname=${_appname}-bin
pkgver=1.504.0
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
sha256sums_aarch64=('7653d9b8a6b4ec2a151e7c11b8dab0e6e14c44628809e464e877809370d1645c')
sha256sums_x86_64=('db6d05d15ed7911419dc8a51223f7770f43dc05e82630888aa8f6456ae16b701')
b2sums=('ddb0252f3de49c63f92963fdad8a31a0ff582380a66a2b76f136b09021e878c6c4bb7c6f2eb4fbb3135a38b7f4a47d2ded25a05069bd3d055d7c718775b7bf54')
b2sums_aarch64=('f4a16569f63b808b98899e3abb3842f0abeba45d29b879f6c4ac4de81ef1a31c7ddc5a52ffb407af947f7ef9ab904c6af96af7391465b5824f195178d6ddbc9f')
b2sums_x86_64=('f2c5c178bd27c7eb65484fe994b34141f378c87738e701af7edc7867881b8706fe4e0d6023471b21e421b8de4011f70847568a249d5d8e2b0e6510bf5f92057f')

options=("!strip")

package() {
    install -Dm755 copilot-language-server -t "${pkgdir}/usr/bin"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_appname}"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_appname}"
}
