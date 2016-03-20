# Maintainer: TheAifam5 <aifam96 at gmail dot com>

pkgname=jtyr-oh-my-zsh-theme-git
pkgver=r2.12164f2
pkgrel=1
pkgdesc='A jtyr oh-my-zsh shell theme'
arch=('any')
url='https://gist.github.com/jtyr/97f05d4ce1e027094ae7'
license=('MIT')
depends=('zsh' 'oh-my-zsh-git')
source=('git+https://gist.github.com/97f05d4ce1e027094ae7.git')
sha256sums=('SKIP')
makedepends=('git')

pkgver() {
    cd 97f05d4ce1e027094ae7
    (
        set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package() {
    cd 97f05d4ce1e027094ae7

    # Install the theme
    install -D -m644 jtyr.zsh-theme "${pkgdir}/usr/share/oh-my-zsh/themes/jtyr.zsh-theme"
}

# vim:set ts=4 sw=4 et:
