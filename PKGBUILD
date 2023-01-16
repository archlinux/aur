# Maintainer: Matthew McGinn <mamcgi@gmail.com>
# Contributor: Daniel Greve <greve.daniel.l@gmail.com>

pkgname=zsh-pure-prompt-git
pkgver=1.21.0.r0.g2f13dea
pkgrel=1
pkgdesc='Pretty, minimal and fast ZSH prompt'
arch=('any')
url='https://github.com/sindresorhus/pure'
license=('MIT')
makedepends=('git>=2.0.0')
depends=('zsh>=5.0.0')
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
