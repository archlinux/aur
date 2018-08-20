# Maintainer: Matthias Lisin <ml@visu.li>
# Contributor: Hugo Rodrigues <hugorodrigues at openmailbox dot com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=vim-dart-plugin-git
pkgver=0.1.0.r42.g940adde
pkgrel=1
pkgdesc='Syntax highlighting for Dart in Vim'
arch=('any')
url='https://github.com/dart-lang/dart-vim-plugin'
license=('BSD')
depends=('vim-runtime')
makedepends=('git')
conflicts=('vim-dart-plugin')
provides=('vim-dart-plugin')
source=("$pkgname::git+https://github.com/dart-lang/dart-vim-plugin.git")
sha512sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/-/.r/;s/-/./'
}

package() {
    cd "$pkgname"
    local installpath="$pkgdir/usr/share/vim/vimfiles"
    install -dm755 "$installpath"
    cp -rt "$installpath" autoload doc ftdetect ftplugin indent plugin syntax
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
