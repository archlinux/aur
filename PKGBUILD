# Maintainer: Adrian Lopez <zeioth@hotmail.com>
pkgname=chatgpt-shell-cli
pkgver=0.1
pkgrel=1
pkgdesc="Use OpenAI's ChatGPT and DALL-E from the terminal."
arch=(any)
url="https://github.com/0xacx/chatGPT-shell-cli.git"
license=('MIT')
depends=(jq curl)
provides=(chatgpt-shell-cli)
conflicts=(chatgpt-shell-cli-git)
source=("git+$url#commit=e47853176d2cc36602ca04507fd3b5525f623737")
sha256sums=('SKIP')

package() {
  # Instead of using the provided install.sh, we just add this line for GNU Linux
  sed -i 's/open "\${image_url}"/xdg-open "\${image_url}"/g' "${srcdir}/chatGPT-shell-cli/chatgpt.sh" 

  # Install
  install -Dm755 "${srcdir}/chatGPT-shell-cli/chatgpt.sh" "${pkgdir}/usr/local/bin/chatgpt"
  install -Dm444 "${srcdir}/chatGPT-shell-cli/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
