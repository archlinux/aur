# Maintainer: shinrax2
_reponame=per-device-application-volume
pkgname=pdav
pkgver=0.1.0
pkgrel=1
pkgdesc="user daemon to automatically save and restore application volume settings based on default output device for pulseaudio/pipewire-pulse"
arch=(any)
url="https://github.com/shinrax2/per-device-application-volume"
license=('MIT')
depends=('python>=3' 'python-pulsectl' 'systemd' 'pulse-native-provider' 'libpulse')
source=("git+https://github.com/shinrax2/per-device-application-volume.git#tag=$pkgver")
conflicts=('pdav-git')
md5sums=('SKIP')
install=pdav.install

package() {
    cd $_reponame
    install -Dm755 "pdav" \
        -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 quirks.json \
        "$pkgdir/usr/share/pdav/quirks.json"
    install -Dm644 pdav.service \
        "$pkgdir/etc/systemd/user/pdav.service"
}
