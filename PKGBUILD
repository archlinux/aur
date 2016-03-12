# Maintainer: FadeMind <fademind@gmail.com>

pkgname=asus-nb-wmi-reload-git
pkgver=20160312
pkgrel=1
pkgdesc="Systemd service for reload Asus Notebooks WMI Hotkey Driver after resume for restoring light on WLAN LED"
arch=('any')
url="https://github.com/FadeMind/${pkgname/-git/}"
license=('GPL2')
depends=('bash' 
         'kmod' 
         'systemd')
makedepends=('git')
source=("${pkgname/-git/}::git+${url}.git")
sha256sums=('SKIP')
install="${pkgname/-git/}.install"

pkgver() {
    cd ${pkgname/-git/}
    git log -1 --format="%cd" --date=short | tr -d '-'
}

package() {
    install -Dm644 "${pkgname/-git/}/${pkgname/-git/}.service"  "${pkgdir}/usr/lib/systemd/system/${pkgname/-git/}.service"
    install -Dm755 "${pkgname/-git/}/${pkgname/-git/}"          "${pkgdir}/usr/bin/${pkgname/-git/}"
}
