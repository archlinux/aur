# Maintainer: Ainola

pkgname=lazy-ips-git
pkgver=r2.9048f9f
pkgrel=2
pkgdesc="Patch ROMs with IPS files."
arch=('any')
url="https://github.com/btimofeev/lazy_ips"
license=('GPL3')
depends=('python2' 'pygtk')
source=("git+https://github.com/btimofeev/lazy_ips.git")
sha256sums=('SKIP')

prepare() {
    gendesk --name "Lazy IPS" ../PKGBUILD
}

pkgver() {
    cd lazy_ips
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -Dm755 lazy_ips/lazy_ips.py "$pkgdir/usr/bin/lazy_ips"
    ln -s /usr/bin/lazy_ips "$pkgdir/usr/bin/lazy-ips"
    install -Dm644 lazy-ips.desktop -t "$pkgdir/usr/share/applications/"
}
