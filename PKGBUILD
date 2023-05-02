# Maintainer: Alad Wenter <https://github.com/AladW>
# Co-Maintainer: Cedric Girard <cgirard [dot] archlinux [at] valinor [dot] fr>
pkgname=aurutils
pkgver=13.4
pkgrel=1
pkgdesc='helper tools for the arch user repository'
url='https://github.com/AladW/aurutils'
arch=('any')
license=('custom:ISC')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
changelog=aurutils.changelog
install=aurutils.install
sha256sums=('2fe8e05ccbd08acaf5f80db4ac0220db7e53969590f6a8f1b818ec125baa16a6')
depends=('git' 'pacutils' 'curl' 'perl')
optdepends=('bash-completion: bash completion'
            'zsh: zsh completion'
            'devtools: aur-chroot'
            'vifm: default pager'
            'perl-json-xs: faster JSON serialization'
            'ninja: aur-sync ninja support'
            'bat: view-delta example script'
            'git-delta: view-delta example script'
            'setconf: sync-rebuild example script')

build() {
    cd "$pkgname-$pkgver"
    make AURUTILS_VERSION="$pkgver"
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
