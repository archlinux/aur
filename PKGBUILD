# Maintainer: Sondre Nilsen <echo "bmlsc2VuLnNvbmRyZUBnbWFpbC5jb20K" | base64 -d>

pkgname=git-ignore-bin
pkgver=1.2.0
pkgrel=0
pkgdesc="Quickly and easily list and fetch .gitignore templates from www.gitignore.io"
url="https://github.com/sondr3/git-ignore"
arch=('x86_64')
license=('GPL3')
provides=('git-ignore')
conflicts=('git-ignore')
source_x86_64=("https://github.com/sondr3/git-ignore/releases/download/v${pkgver}/${pkgname/-bin/}-x86_64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('5a3a4e2c94e2645b56e021338d94236bf730d4f36dac1cb31390b8b8c4016cf8')

package() {
  install -Dm755 git-ignore "$pkgdir/usr/bin/git-ignore"
  install -Dm644 git-ignore.1 "$pkgdir/usr/share/man/man1/git-ignore.1"

  install -Dm644 git-ignore.bash "$pkgdir/usr/share/bash-completion/completions/git-ignore"
  install -Dm644 git-ignore.fish "$pkgdir/usr/share/fish/vendor_completions.d/git-ignore.fish"
  install -Dm644 _git-ignore "$pkgdir/usr/share/zsh/site-functions/_git-ignore"
}
