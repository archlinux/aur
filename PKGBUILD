# Maintainer: Deckweiss <Deckweiss75@gmail.com>

_name="auto-root"
pkgname="${_name}-git"
pkgver=r24.dbf039f
pkgrel=1
pkgdesc="A script that automatically reruns your last command as root if you forgot it. Requires 'bash' or 'zsh'."
arch=('any')
url="https://github.com/Deckweiss/${_name}"
license=('GPLv3')
depends=(
    'util-linux'
    'coreutils'
)
optdepends=(
    'bash: either one of the two shells is required'
    'zsh: either one of the two shells is required'
    'sudo: you can use su instead'
)
conflicts=(${_name})
provides=(${_name})
source=("git+https://github.com/Deckweiss/$_name.git")
sha256sums=('SKIP')

install=$_name.install

pkgver() {
  cd "${srcdir}/${_name}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$_name"

    install -D -t "$pkgdir/opt/auto-root" "auto-root.bash" "auto-root-shrc"
}
