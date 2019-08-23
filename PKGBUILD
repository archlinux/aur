# Maintainer: spaceships <https://aur.archlinux.org/account/spaceships>
# Contributor: Brent Carmer <bcarmer@gmail.com>

pkgname=ghcup-git
_pkgname=ghcup

pkgver=0.0.7.r100.g5c1d711
pkgrel=1

pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

license=('BSD')
depends=()
pkgdesc='Painless installation of GHC toolchain'
url='https://gitlab.haskell.org/haskell/ghcup'
arch=('any')
md5sums=('SKIP')
install=ghcup-git.install

source=('git+https://gitlab.haskell.org/haskell/ghcup.git')

package() {
    mkdir -p $pkgdir/usr/bin
    install $srcdir/ghcup/ghcup $pkgdir/usr/bin
    install -Dm644 $srcdir/ghcup/.bash-completion $pkgdir/usr/share/bash-completion/completions/ghcup
}
