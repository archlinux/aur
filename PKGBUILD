# Maintainer: Max Gautier <mg+archlinux@max.gautier.name>

pkgname=vim-graphql
pkgver=1.4
pkgrel=1
pkgdesc="Vim syntax, file detection, and indentation plugin for GraphQL queries"
arch=('any')
url="https://github.com/jparise/$pkgname"
license=('MIT')
depends=('vim')
groups=('vim-plugins')
source=("$url/archive/v$pkgver.tar.gz")
sha512sums=('784212b9e8e6c85d491cfd5850bde9e9bfa720fc087336801080406ce63b6806d28eb39c8f42e8da46aa0011a27d201355c7da27f23985948f6caa40f8f4eb2b')

package() {

    cd "$pkgname-$pkgver"
    install -dm 644 "license" "$pkgdir/usr/share/licenses/${pkgname}/license"

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
