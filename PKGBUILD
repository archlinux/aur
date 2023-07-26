# Maintainer: Johannes Loher <johannes dot loher at fg4f dot de>

pkgname="rofi-ykman-git"
pkgver=r15.5275382
pkgrel=3
pkgdesc='YubiKey manager script for rofi'
arch=('any')
url='https://github.com/nukeop/rofi-ykman'
license=('AGPL-3.0')
depends=('bash' 'yubikey-manager' 'rofi')
optdepends=(
    'xclip: X11 clipboard support'
    'wl-clipboard: Wayland clipboard support'
    'xdotool: X11 typing support'
    'wtype: Wayland typing support'
    'libnotify: notification support'
)
makedepends=('git')
conflicts=('rofi-ykman')
provides=('rofi-ykman')
source=("$pkgname::git+$url.git#branch=master")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package(){
    cd "$pkgname"
    install -Dm755 "${pkgname::-4}" "$pkgdir/usr/bin/${pkgname::-4}"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname::-4}/LICENSE"
}
