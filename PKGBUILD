# Maintainer: FoxlikeCreature <safonovkirill113@gmail.com>
pkgname=caelestia-rgb-sync
pkgver=1.0.0
pkgrel=1
pkgdesc='Sync RGB lighting to caelestia desktop shell accent color'
arch=('any')
url='https://github.com/FoxlikeCreature/caelestia-rgb-sync'
license=('MIT')
depends=(
    'python'
    'python-openrgb'
    'python-tomli-w'
    'inotify-tools'
    'openrgb'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0bfb12c0792e76cb4a1fedd46f881a5cc5b3561220f2a71f51a8cbab6b3010a3')

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 caelestia-rgb-sync \
        "$pkgdir/usr/bin/caelestia-rgb-sync"

    install -Dm644 systemd/caelestia-rgb.service \
        "$pkgdir/usr/lib/systemd/user/caelestia-rgb.service"

    install -Dm644 systemd/openrgb.service \
        "$pkgdir/usr/lib/systemd/user/openrgb.service"

    install -Dm644 config.example.toml \
        "$pkgdir/usr/share/caelestia-rgb-sync/config.example.toml"

    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 README.md \
        "$pkgdir/usr/share/doc/$pkgname/README.md"
}
