# Maintainer: Tobias Frilling <tobias@frilling-online.de>
pkgname=leiningen-completions
pkgver=2.5.0
pkgrel=1
pkgdesc="Completion scripts for leiningen"
arch=('any')
url="http://github.com/technomancy/leiningen"
license=("EPL")
conflicts=('zsh-completions' 'zsh-completions-git')

_commit="c78a8110a8f4db2e84c0daf09ed1145a8aa18c30"
source=("https://raw.github.com/technomancy/leiningen/$_commit/zsh_completion.zsh"
        "https://raw.github.com/technomancy/leiningen/$_commit/bash_completion.bash")
sha1sums=('9a2986ec76216060ff2e65ef0af142ca50aaa63b'
          '824028076c419324a7b32f5344fef4d546ac21b5')

package() {
  cd ${srcdir}
  install -m 0644 -D "${srcdir}"/zsh_completion.zsh "${pkgdir}"/usr/share/zsh/site-functions/_lein
  install -m 0644 -D "${srcdir}"/bash_completion.bash "${pkgdir}"/usr/share/bash-completion/completions/lein
}
