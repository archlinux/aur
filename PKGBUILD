# Maintainer: Nils Werner <nils.werner@gmail.com>

pkgname=crestic
pkgver=0.7.0
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
    "e431c3388636bceab71080a24880f7cf7e521f0794b0dfe7f402a03fc5a8eba0"
    "487bdee984708f7c8e3fdf300d372a9cf60ac212c3898231011d50b4bb2161e6"
    "be3b2461029a2d92329bcc1b42a8207f1c75ce03a6df86d72788ff2b8772ba70"
    "d8a94324994b2caae186f70f1463bee7b998547e31739c6e790f9fca37019022"
    "ea0050225c6527f8ebcc146f6dd60e15dede64b5820e25d94e511f7c01594ffc"
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
