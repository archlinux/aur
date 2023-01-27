# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Simon Legner <Simon.Legner@gmail.com

pkgname=cht.sh-git
pkgver=r819.d2b8697
pkgrel=1
pkgdesc="The only cheat sheet you need (command line client for cheat.sh)"
arch=('any')
url='https://github.com/chubin/cheat.sh'
license=('MIT')
provides=('cht.sh')
conflicts=('cht.sh')
depends=('curl' 'xsel' 'rlwrap')
makedepends=('git')
source=("${pkgname}::git+https://github.com/chubin/cheat.sh")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname}"
  install -Dm755 "share/cht.sh.txt" "$pkgdir/usr/bin/cht.sh"
  install -Dm644 "share/bash_completion.txt" "$pkgdir/usr/share/bash-completion/completions/cht.sh"
  install -Dm644 "share/fish.txt" "$pkgdir/usr/share/fish/vendor_completions.d/cht.sh.fish"
  install -Dm644 "share/zsh.txt" "$pkgdir/usr/share/zsh/site-functions/_cht.sh"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
