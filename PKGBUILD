# Maintainer: Daniel Perez

pkgname=entire-cli-bin
pkgver=0.13.1
pkgrel=1
pkgdesc='Git-native AI agent session tracking'
arch=('x86_64' 'aarch64')
url='https://github.com/entireio/cli'
license=('MIT')
depends=('git')
provides=("entire-cli=$pkgver")
conflicts=('entire-cli')
options=('!debug')
source_x86_64=("entire-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/entire_linux_amd64.tar.gz")
source_aarch64=("entire-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/entire_linux_arm64.tar.gz")
sha256sums_x86_64=('c7afbecd5e18bee7a97b69ec318ff9f14033994eae309746c98ec7eed9c33048')
sha256sums_aarch64=('dd3df46d2414af06594c1013b679e3c2f75c63138cdbbaefd79055091b1e7264')

package() {
  install -Dm755 entire "$pkgdir/usr/bin/entire"
  install -Dm755 git-remote-entire "$pkgdir/usr/bin/git-remote-entire"
  install -Dm644 completions/entire.bash "$pkgdir/usr/share/bash-completion/completions/entire"
  install -Dm644 completions/entire.fish "$pkgdir/usr/share/fish/vendor_completions.d/entire.fish"
  install -Dm644 completions/entire.zsh "$pkgdir/usr/share/zsh/site-functions/_entire"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
