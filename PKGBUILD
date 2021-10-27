# Maintainer: Simon Zack <simonzack@gmail.com>
pkgname=zsh-autoswitch-virtualenv-git
pkgver=3.3.2.r0.gecc53e3
pkgrel=1
pkgdesc='ZSH plugin that switches python virtualenvs automatically as you move between directories.'
arch=('any')
url="https://github.com/MichaelAquilina/zsh-autoswitch-virtualenv"
license=('GPL3')
depends=('zsh' 'python' 'pwgen')
makedepends=('git')
optdepends=(
  'python-pipenv: Pipenv integration'
  'python-poetry: Poetry integration'
)
source=('zsh-autoswitch-virtualenv::git+https://github.com/MichaelAquilina/zsh-autoswitch-virtualenv.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/zsh-autoswitch-virtualenv"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir"
  install -Dm644 "${pkgname%-git}/autoswitch_virtualenv.plugin.zsh" \
    "$pkgdir/usr/share/zsh/plugins/${pkgname%-git}/${pkgname%-git}.plugin.zsh"
}
