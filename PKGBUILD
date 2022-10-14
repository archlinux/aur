# Maintainer: Samisafool <thenerdiestguy@gmail.com>
_pkgname=daemon-dotfiles
pkgname=kvantum-theme-daemon-git
pkgver=r4.3bd2e02
pkgrel=3
pkgdesc="Cyberpunk style theme for KDE"
arch=(any)
url="https://github.com/MathisP75/daemon-dotfiles"
license=('GPL')
depends=(kvantum)
makedepends=(git)
provides=(kvantum-theme-daemon)
conflicts=(kvantum-theme-daemon)
source=('git+https://github.com/MathisP75/daemon-dotfiles.git')
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$_pkgname"
    install -dm755 $pkgdir/usr/share/Kvantum
    cp -r 'kvantum-themes/Daemon' $pkgdir/usr/share/Kvantum/
}
