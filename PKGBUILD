# Maintainer: Sondre Nilsen <echo "bmlsc2VuLnNvbmRyZUBnbWFpbC5jb20K" | base64 -d>

pkgname=git-ignore-bin
pkgver=1.3.1
pkgrel=1
pkgdesc="Quickly and easily list and fetch .gitignore templates from www.gitignore.io"
url="https://github.com/sondr3/git-ignore"
arch=('x86_64')
license=('GPL3')
provides=('git-ignore')
conflicts=('git-ignore')
source_x86_64=("https://github.com/sondr3/git-ignore/releases/download/v${pkgver}/${pkgname/-bin/}-x86_64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('82a2ae823b1e3b008a615e5340b125a5cee1eee1ca17513337b5208fb7e7ed47')

package() {
  install -Dm755 git-ignore "$pkgdir/usr/bin/git-ignore"
  install -Dm644 git-ignore.1 "$pkgdir/usr/share/man/man1/git-ignore.1"

  install -Dm644 git-ignore.bash "$pkgdir/usr/share/bash-completion/completions/git-ignore"
  install -Dm644 git-ignore.fish "$pkgdir/usr/share/fish/vendor_completions.d/git-ignore.fish"
  install -Dm644 _git-ignore "$pkgdir/usr/share/zsh/site-functions/_git-ignore"
}
