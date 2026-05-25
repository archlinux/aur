pkgname=rustmius-bin
_pkgname=rustmius
pkgver=2.4.2
pkgrel=1
pkgdesc="Full local Termius alternative for Linux (GTK4) - binary release"
arch=('x86_64')
url="https://github.com/Cleboost/Rustmius"
license=('AGPL-3.0-or-later')
depends=('gtk4' 'vte4')
provides=("$_pkgname")
conflicts=("$_pkgname")

source=(
    "org.rustmius.Rustmius.desktop::https://raw.githubusercontent.com/Cleboost/Rustmius/refs/heads/master/packages/org.rustmius.Rustmius.desktop"
    "$_pkgname.png::https://raw.githubusercontent.com/Cleboost/Rustmius/refs/heads/master/packages/rustmius.png"
    "LICENSE::https://raw.githubusercontent.com/Cleboost/Rustmius/refs/heads/master/LICENSE"
    "$_pkgname-$pkgver-x86_64::$url/releases/download/v$pkgver/$_pkgname-x86_64"
)

sha256sums=('1498673b59f13bdd2a5beb43d72fc8e9330599324f9a4d70bd52e1d303ad9959'
            'c8c9adc6e26cc54f2b8d8ce41a093b71b5e9e4338d6e278803d87d2a6e94422d'
            '8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef'
            'b64044db5b5739382eb661427cf500109fa8933da17837664caade5a656af114')

package() {
    install -Dm755 "$_pkgname-$pkgver-x86_64" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "org.rustmius.Rustmius.desktop" "$pkgdir/usr/share/applications/org.rustmius.Rustmius.desktop"
    install -Dm644 "$_pkgname.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_pkgname.png"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
