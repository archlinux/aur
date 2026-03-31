# Maintainer: Dunky <braxtinmoss13@gmail.com>
# Contributor: Petrov Vladislav <ejiek@mail.ru>

pkgname=rofi-wifi-menu-git
_pkgname=rofi-wifi-menu
pkgver=r32.bd5f34f
pkgrel=1
pkgdesc="Bash script providing a WiFi menu using rofi and nmcli"
arch=('any')
url='https://github.com/zbaylin/rofi-wifi-menu'
license=('unknown')
install=rofi-wifi-menu.install
# wireless_tools removed: iwconfig is unused since commit bd5f34f (2019)
depends=('rofi' 'networkmanager' 'bc')
makedepends=('git')
source=("git+https://github.com/zbaylin/rofi-wifi-menu.git")
sha256sums=('SKIP')
provides=('rofi-wifi-menu')
conflicts=('rofi-wifi-menu')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$_pkgname"
    install -Dm755 rofi-wifi-menu.sh "$pkgdir/usr/bin/rofi-wifi-menu"
    install -Dm644 config.example "$pkgdir/usr/share/rofi-wifi-menu/config.example"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
