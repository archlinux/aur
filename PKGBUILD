# Maintainer: MonstrousOgre <monstrousogre0813@gmail.com>

_pkgname=zsh-vi-mode
pkgname=zsh-vi-mode-git
pkgver=0.6.0.r26.g20c7e76
pkgrel=1
pkgdesc="A better and friendly vi(vim) mode plugin for ZSH"
arch=('any')
url="https://github.com/jeffreytse/zsh-vi-mode"
license=('MIT')
depends=('zsh')
makedepends=('git')
provides=('zsh-vi-mode')
conflicts=('zsh-vi-mode')
source=("git+$url")
sha256sums=(SKIP)

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_pkgname/"

  install -Dm644 zsh-vi-mode.plugin.zsh "${pkgdir}/usr/share/zsh/plugins/$_pkgname/zsh-vi-mode.plugin.zsh"
  install -Dm644 zsh-vi-mode.zsh "${pkgdir}/usr/share/zsh/plugins/$_pkgname/zsh-vi-mode.zsh"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
