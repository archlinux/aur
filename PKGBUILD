# Maintainer: Max Gautier <mg+archlinux@max.gautier.name>

pkgname=vim-tips
pkgver=0.4
pkgrel=1
pkgdesc="Display tips at Vim startup"
arch=('any')
url="https://github.com/michaelb/$pkgname"
license=('MIT')
depends=('vim')
groups=('vim-plugins')
source=("$pkgname-$pkgver::$url/archive/v$pkgver.tar.gz")
sha512sums=('156b21e43a34cd69b00f3540615680cba008507b38a665616e739fc86b5da1f0ef44f7311b4430c51bbfc072dc5d3459128239029090b3d5e66c15ab8f5d7cad')

package() {

    cd "$pkgname-$pkgver"

    install -Dm 644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE

    # Install vimfiles
    local vimfiles="$pkgdir/usr/share/vim/vimfiles"
    mkdir -p "$vimfiles"
	cp -r --no-preserve=ownership -t "$vimfiles" plugin/
}
