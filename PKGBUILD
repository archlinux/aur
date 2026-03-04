# Maintainer: Basecamp <support@basecamp.com>
pkgname=basecamp-cli
pkgver=0.2.2
pkgrel=1
pkgdesc="CLI for Basecamp project management"
arch=('x86_64' 'aarch64')
url="https://github.com/basecamp/basecamp-cli"
license=('MIT')
provides=('basecamp')
conflicts=('basecamp' 'basecamp-bin')
optdepends=(
  'bash-completion: for bash shell completions'
  'zsh: for zsh shell completions'
  'fish: for fish shell completions'
)
source_x86_64=("https://github.com/basecamp/basecamp-cli/releases/download/v0.2.2/basecamp_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/basecamp/basecamp-cli/releases/download/v0.2.2/basecamp_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('dc27036f869feb7299546d1688251393d059269f7df6c4e53759b31e0057ee3c')
sha256sums_aarch64=('fad14a10bdf2949ee49a85658617c35a6bd9a7c0459161aae37698f655ed68da')

package() {
  install -Dm755 "basecamp" "${pkgdir}/usr/bin/basecamp"
  install -Dm644 "MIT-LICENSE" "${pkgdir}/usr/share/licenses/basecamp/MIT-LICENSE"
  install -Dm644 "completions/basecamp.bash" "${pkgdir}/usr/share/bash-completion/completions/basecamp"
  install -Dm644 "completions/_basecamp" "${pkgdir}/usr/share/zsh/site-functions/_basecamp"
  install -Dm644 "completions/basecamp.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/basecamp.fish"
}
