# Maintainer: Brian Wo <brianwo at protonmail dot com>

_name='zsh-notify'
pkgname="${_name}-git"
pkgver=r94.9c1dac8
pkgrel=1
pkgdesc="Desktop notifications for long-running commands in zsh."
url="https://github.com/marzocchi/zsh-notify"
arch=('any')
license=('MIT')
depends=('zsh' 'xdotool')
optdepends=('wmctrl: To activate the terminal and set the urgency hint')
makedepends=('git')
provides=('zsh-notify')
source=("${_name}::${url//https/git+https}")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_name}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${_name}"
    install -d "${pkgdir}/usr/share/zsh/plugins/${_name}"
    cp -a --no-preserve=ownership * "${pkgdir}/usr/share/zsh/plugins/${_name}"
}
