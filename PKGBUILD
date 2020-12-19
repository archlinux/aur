# Maintainer: Zhang.j.k <zhangjk67 at gmail dian com>

pkgname=k
pkgver=0.0.5
pkgrel=1
pkgdesc="a zsh script / plugin to make directory listings more readable, adding a bit of color and some git status information on files and directories."
arch=('any')
url="https://github.com/supercrabtree/k"
license=('unknown')
depends=('zsh')
makedepends=('git')
provides=("$pkgname")
conflicts=("${pkgname%+git}")
source=('git+https://github.com/supercrabtree/k.git')
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname"
	install -Dm755 * -t "$pkgdir/usr/bin/k"
    if grep -q "source /usr/bin/k/k.sh" $HOME/.zshrc
    then
        echo "config in .zshrc already satisfied"
    else
        echo "source /usr/bin/k/k.sh" >> $HOME/.zshrc
    fi
}