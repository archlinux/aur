# Maintainer: Adrian Lopez <zeioth@hotmail.com>
# Contributors: malmerri
pkgname=chatgpt-shell-cli
_pkgname=chatGPT-shell-cli
pkgver=0.5
pkgrel=5
pkgdesc="Use OpenAI's ChatGPT and DALL-E from the terminal."
arch=(any)
url="https://github.com/0xacx/chatGPT-shell-cli.git"
license=('MIT')
depends=(jq curl glow)
conflicts=(chatgpt-shell-cli-git)
source=("git+$url#commit=926587a2234b8ae3754a1db9715f4636205159dc")
sha256sums=('SKIP')

package() {
  # Instead of using the provided install.sh, we just add this line for GNU Linux
  sed -i 's/open "\${image_url}"/xdg-open "\${image_url}"/g' "${srcdir}/chatGPT-shell-cli/chatgpt.sh"

  # Install
  install -Dm755 "${srcdir}/chatGPT-shell-cli/chatgpt.sh" "${pkgdir}/usr/bin/chatgpt"
  install -Dm644 "${srcdir}/chatGPT-shell-cli/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
