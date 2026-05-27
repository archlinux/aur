# Maintainer: Sergey Morozov <12103270+v4n6@users.noreply.github.com>
_appname=copilot-language-server
pkgname=${_appname}-bin
pkgver=1.497.0
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
sha256sums_aarch64=('681b7dd3f543013c15a46dff831be55faf14fd050b62b47c7bb7f5399753b8e9')
sha256sums_x86_64=('8299afb909659a7149c056fda9e61b18e0b6964e09f3ca397f23d242e3920fd6')
b2sums=('ddb0252f3de49c63f92963fdad8a31a0ff582380a66a2b76f136b09021e878c6c4bb7c6f2eb4fbb3135a38b7f4a47d2ded25a05069bd3d055d7c718775b7bf54')
b2sums_aarch64=('9300c70f89605b96f9fab3789a15cec0b79ae89982efbfdbbca860b9751ac74c3a9847e0c9b0fd85ab35694d7533d22c6d9dfce5b25375efc36febb7d1cbd1b4')
b2sums_x86_64=('5691dde01310f4fcdcdcf053f7765cd612ef02d956d98616e745b195eced5538a97048fe6ea55fbb044307b81e034e5b05583c70063cb7f674394f1a3ffa4610')

options=("!strip")

package() {
    install -Dm755 copilot-language-server -t "${pkgdir}/usr/bin"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_appname}"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_appname}"
}
