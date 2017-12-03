# Maintainer: Matthew McGinn <mamcgi@gmail.com>
# Contributor: Daniel Greve <greve.daniel.l@gmail.com>

pkgname=zsh-pure-prompt-git
pkgver=1.6.0.r3.ga3b22b2
pkgrel=1
pkgdesc='Pretty, minimal and fast ZSH prompt'
arch=('any')
url='https://github.com/sindresorhus/pure'
license=('MIT')
depends=('git>=2.0.0' 'zsh>=5.0.0')
source=('git+https://github.com/sindresorhus/pure.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/pure"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/pure"
  install -Dm644 pure.zsh "${pkgdir}/usr/share/zsh/functions/Prompts/prompt_pure_setup"
  install -Dm644 async.zsh "${pkgdir}/usr/share/zsh/functions/Prompts/async"
}
