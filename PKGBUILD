# Maintainer: Łukasz Moroz <lukaszmoroz@gmail.com>

pkgname=nautilus-copy-path
pkgver=1.10.2
pkgrel=2
pkgdesc="Configurable extension for Nautilus to copy path, URI, or name"
arch=('any')
url="https://github.com/chr314/nautilus-copy-path"
license=('MIT')
depends=('python-nautilus' 'python-gobject')
backup=("usr/share/nautilus-python/extensions/nautilus-copy-path/config.json")
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/chr314/nautilus-copy-path/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('4004e82ff601604ae466aabcb1429e1c07ac9e181a99bc5173827480c46698a8b8df7579441ee5225d1d3d0a830d0667e45de4e03833bc7906cb893e24afb1df')

package() {
    cd "$pkgname-$pkgver"
    install -Dm644 -t "$pkgdir/usr/share/licenses/nautilus-copy-path" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/nautilus-python/extensions" nautilus-copy-path.py
    install -Dm644 -t "$pkgdir/usr/share/nautilus-python/extensions/nautilus-copy-path" nautilus_copy_path.py config.json translation.py
    install -Dm644 -t "$pkgdir/usr/share/nautilus-python/extensions/nautilus-copy-path/translations" translations/*.json
}
