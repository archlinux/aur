# Maintainer: Max Gautier <mg+archlinux@max.gautier.name>

pkgname=vim-graphql
pkgver=1.6
pkgrel=1
pkgdesc="Vim syntax, file detection, and indentation plugin for GraphQL queries"
arch=('any')
url="https://github.com/jparise/$pkgname"
license=('MIT')
depends=('vim')
groups=('vim-plugins')
source=("$pkgname-$pkgver::$url/archive/v$pkgver.tar.gz")
sha512sums=('1c6684974f6c2019a6da94b78154fb8f0d4ad0639ec10c41816c30500dab9e733a3e4d58b88d1e7f72c2a7de8566336e09aa35e748659d740d4a849c765e614a')

package() {

    cd "$pkgname-$pkgver"
    install -D -m 644 -t "$pkgdir/usr/share/licenses/${pkgname}/" "LICENSE"

    # install vimfiles

    local vimfiles="$pkgdir/usr/share/vim/vimfiles"
    mkdir -p "$vimfiles"
    cp -dr --no-preserve=ownership \
                        after \
                        autoload \
                        doc \
                        ftdetect \
                        ftplugin \
                        indent \
                        syntax \
                        "$vimfiles"
}
