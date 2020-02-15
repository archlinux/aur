# Maintainer: Nils Werner <nils.werner@gmail.com>

pkgname=crestic
pkgver=0.2.0
pkgrel=3
pkgdesc="Configurable restic wrapper"
arch=('any')
url="https://github.com/nils-werner/$pkgname"
license=('MIT')
depends=('python' 'restic')
source=(
    "https://github.com/nils-werner/$pkgname/archive/v$pkgver.tar.gz"
    "crestic@.service"
    "crestic@.timer"
)
sha256sums=(
    "1f8475dc040dbda93f4317277a799db1d6097e064032ff27911eecf4f9e28905"
    "88713417be68293e78d73ec941407e6987d5d123d383bfd0545e244bfa6f844f"
    "5ce56bfdee1d7ad4027008a0198525573b456473c0eec3527849fd397bc296bc"
)

package() {
    install -Dm 0644 crestic@.service -t "$pkgdir"/usr/lib/systemd/system/
    install -Dm 0644 crestic@.timer -t "$pkgdir"/usr/lib/systemd/system/
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 0755 "$pkgname".py "$pkgdir"/usr/bin/"$pkgname"
    install -Dm 0644 LICENSE -t "$pkgdir"/usr/share/licenses/"$pkgname"/
}
