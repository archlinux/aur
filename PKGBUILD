# Maintainer: Zhang.j.k <zhangjk67 at gmail dian com>

pkgname=k
pkgver=0.0.5
pkgrel=2
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
    install -vDm 755 "${pkgname}.sh" "k.plugin.zsh" \
    -t "${pkgdir}/usr/share/zsh/plugins/${pkgname}/"
    # docs
    install -vDm 644 readme.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}