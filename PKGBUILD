# Maintainer: nicknb <nicknb at posteo dot com>
pkgname=auh
pkgver=0.0.5
pkgrel=1
pkgdesc="AUR helper written in Bash"
arch=("any")
url="https://git.sr.ht/~nicknb/$pkgname"
license=("GPL-3.0-or-later")
provides=("$pkgname")
conflicts=("$pkgname")
depends=("jq" "git" "curl" "pacman" "sudo")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('20829c37b9283eeba3bdade3dd5ea1c809b0ba96f22673404819e8318d6dd219')

package() {
    cd "$pkgname-v$pkgver"
    install -Dm 755 $pkgname $pkgdir/usr/bin/$pkgname
    install -Dm 644 LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
    install -Dm 644 completion/$pkgname.fish $pkgdir/usr/share/fish/vendor_completions.d/${pkgname}.fish
}
