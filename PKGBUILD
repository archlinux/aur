# Maintainer: FoxlikeCreature <safonovkirill113@gmail.com>
pkgname=caelestia-rgb-sync
pkgver=1.2.2
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
sha256sums=('d273082269b7f5cf3f756060269b40d6295a18b10a096392c779dcaef0d8e519')

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
