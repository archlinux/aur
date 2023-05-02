# Maintainer: Adrian Lopez <zeioth@hotmail.com>
# Contributors: malmerri
pkgname=chatgpt-shell-cli
_pkgname=chatGPT-shell-cli
pkgver=0.3
pkgrel=3
pkgdesc="Use OpenAI's ChatGPT and DALL-E from the terminal."
arch=(any)
url="https://github.com/0xacx/chatGPT-shell-cli.git"
license=('MIT')
depends=(jq curl)
provides=(chatgpt-shell-cli)
conflicts=(chatgpt-shell-cli-git)
source=("git+$url#commit=24a0de13d3f36ec1601bb786f42059906a02e5b7")
sha256sums=('SKIP')

package() {
  # Instead of using the provided install.sh, we just add this line for GNU Linux
  sed -i 's/open "\${image_url}"/xdg-open "\${image_url}"/g' "${srcdir}/chatGPT-shell-cli/chatgpt.sh" 

  # Install
  install -Dm755 "${srcdir}/chatGPT-shell-cli/chatgpt.sh" "${pkgdir}/usr/bin/chatgpt"
  install -Dm644 "${srcdir}/chatGPT-shell-cli/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
