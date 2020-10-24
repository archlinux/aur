# Maintainer: Nils Werner <nils.werner@gmail.com>

pkgname=crestic
pkgver=0.6.0
pkgrel=1
pkgdesc="Configurable restic wrapper"
arch=('any')
url="https://github.com/nils-werner/$pkgname"
license=('MIT')
depends=('python' 'restic')
optdepends=(
    'python-appdirs: support for loading config files using appdirs'
)
source=(
    "https://github.com/nils-werner/$pkgname/archive/v$pkgver.tar.gz"
    "crestic-backup@.service"
    "crestic-backup@.timer"
    "crestic-forget@.service"
    "crestic-forget@.timer"
)
sha256sums=(
    "9587d7b0a9f47d02bcd23aa59b8bd8676094b3085e5b703df19cc6f0a56c9aff"
    "487bdee984708f7c8e3fdf300d372a9cf60ac212c3898231011d50b4bb2161e6"
    "d1a2ab70e79257d39f8ce623fdb1f72243072671a83a0ad4959f7bff8ea9b335"
    "d8a94324994b2caae186f70f1463bee7b998547e31739c6e790f9fca37019022"
    "da503ad36db1f6fac5d1b9ee181a6b24d9a33dfd8d869433f18d208e501c8b27"
)

package() {
    install -Dm 0644 crestic-backup@.service -t "$pkgdir"/usr/lib/systemd/system/
    install -Dm 0644 crestic-backup@.timer -t "$pkgdir"/usr/lib/systemd/system/
    install -Dm 0644 crestic-backup@.service -t "$pkgdir"/usr/lib/systemd/user/
    install -Dm 0644 crestic-backup@.timer -t "$pkgdir"/usr/lib/systemd/user/
    install -Dm 0644 crestic-forget@.service -t "$pkgdir"/usr/lib/systemd/system/
    install -Dm 0644 crestic-forget@.timer -t "$pkgdir"/usr/lib/systemd/system/
    install -Dm 0644 crestic-forget@.service -t "$pkgdir"/usr/lib/systemd/user/
    install -Dm 0644 crestic-forget@.timer -t "$pkgdir"/usr/lib/systemd/user/
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 0755 "$pkgname".py "$pkgdir"/usr/bin/"$pkgname"
    install -Dm 0644 LICENSE -t "$pkgdir"/usr/share/licenses/"$pkgname"/
}
