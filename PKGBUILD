# Maintainer: Cyrinux <pkgbuilds AT levis DOT name>

pkgname=wluma-als-emulator-git
_gitname=wluma-als-emulator
pkgver=master
pkgrel=1
pkgdesc="Light sensor emulator for wluma, write lux from webcam or time based to a file"
license=(MIT)
url=https://github.com/cyrinux/wluma-als-emulator
depends=()
optdepends=('wluma' 'python-pillow' 'ffmpeg')
arch=(any)
makedepends=('git')
conflicts=('fake-light-sensor' 'fake-light-sensor-git')
provides=('wluma-als-emulator')
source=('git://github.com/cyrinux/wluma-als-emulator')
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/wluma-als-emulator"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/wluma-als-emulator"
    install -D -m0755 \
        "${srcdir}/wluma-als-emulator/wluma-als-emulator" \
        "$pkgdir/usr/bin/wluma-als-emulator"
}
