# Maintainer: yurihs <yurisalvador@hotmail.com>
pkgname=waybar-media-git
pkgver=r4.1a4ba79
pkgrel=1
pkgdesc="A Waybar module that displays currently playing media"
arch=("any")
url="https://github.com/yurihs/waybar-media"
license=("MIT")
depends=("python" "python-pydbus" "python-psutil")
makedepends=("git")
optdepends=("plasma-browser-integration: native host to fetch data from browsers via KDE Plasma Integration")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    cd "$pkgname"
    install -Dm755 waybar-media.py "$pkgdir/usr/bin/waybar-media.py"
    install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname%-git}/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
