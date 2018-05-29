# Maintainer: Ainola

pkgname=lazy-ips
pkgver=r2.9048f9f
pkgrel=1
pkgdesc="ips patcher for Linux"
arch=('any')
url="https://github.com/btimofeev/lazy_ips"
license=('GPL3')
depends=('python2' 'pygtk')
source=(
    "git+https://github.com/btimofeev/lazy_ips.git"
    'lazy-ips.desktop'
)
sha256sums=('SKIP'
            '37d16380346b6270a90fc4903ee090bfaa5f3295d72e47c38f9bc3cd38104909')

pkgver() {
    cd "$srcdir/lazy_ips"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -Dm755 "$srcdir/lazy_ips/lazy_ips.py" "$pkgdir/usr/bin/lazy_ips"
    ln -s /usr/bin/lazy_ips "$pkgdir/usr/bin/lazy-ips"
    install -Dm644 "$srcdir/lazy-ips.desktop" "$pkgdir/usr/share/applications/lazy-ips.desktop"
}
