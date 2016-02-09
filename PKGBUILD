# Maintainer: Tobias Frilling <tobias@frilling-online.de>
pkgname=leiningen-completions
pkgver=2.6.1
pkgrel=1
pkgdesc="Completion scripts for leiningen"
arch=('any')
url="http://github.com/technomancy/leiningen"
license=("EPL")
conflicts=('zsh-completions' 'zsh-completions-git')

_commit="f9a464e008214941e93c046413004517325818bb"
source=("https://raw.github.com/technomancy/leiningen/$_commit/zsh_completion.zsh"
        "https://raw.github.com/technomancy/leiningen/$_commit/bash_completion.bash")
md5sums=('651b6383e1c0b1481fe1c93bf8ee2474'
         '1561749a48bc6a3f17627ce6af1d80ba')

package() {
  cd ${srcdir}
  install -m 0644 -D "${srcdir}"/zsh_completion.zsh "${pkgdir}"/usr/share/zsh/site-functions/_lein
  install -m 0644 -D "${srcdir}"/bash_completion.bash "${pkgdir}"/usr/share/bash-completion/completions/lein
}
