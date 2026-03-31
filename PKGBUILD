# Maintainer: Jaeho Cho <jaehho@github>
pkgname=hypr-desktop-git
_pkgname=hypr-desktop
pkgver=r3.ee531a0
pkgrel=1
pkgdesc='Virtual desktop manager and TUI for Hyprland'
arch=('any')
url='https://github.com/jaehho/hypr-desktop'
license=('MIT')
depends=('hyprland' 'python' 'jq' 'socat')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$_pkgname"
    make DESTDIR="$pkgdir" PREFIX=/usr install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
