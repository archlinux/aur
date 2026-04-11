pkgname=rustmius-bin
_pkgname=rustmius
pkgver=2.1.0
pkgrel=1
pkgdesc="Une alternative locale complète à Termius pour Linux (GTK4)"
arch=('x86_64')
url="https://github.com/Cleboost/Rustmius"
license=('MIT')
depends=('gtk4' 'vte4')
provides=("$_pkgname")
conflicts=("$_pkgname")

source=(
    "$_pkgname.desktop::https://raw.githubusercontent.com/Cleboost/Rustmius/refs/heads/master/rustmius.desktop"
    "$_pkgname.png::https://raw.githubusercontent.com/Cleboost/Rustmius/refs/heads/master/rustmius.png"
    "$_pkgname-$pkgver-x86_64::$url/releases/download/v$pkgver/$_pkgname-x86_64"
)

sha256sums=('1498673b59f13bdd2a5beb43d72fc8e9330599324f9a4d70bd52e1d303ad9959'
            'c8c9adc6e26cc54f2b8d8ce41a093b71b5e9e4338d6e278803d87d2a6e94422d'
            'e7e4715eb8bcb62bca4f43200d25a39d3630b4a9973c3b4b69dce534ecb17fb6')

package() {
    install -Dm755 "$_pkgname-$pkgver-x86_64" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
    install -Dm644 "$_pkgname.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_pkgname.png"
}
