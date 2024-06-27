# Maintainer: Mahor Foruzesh <mahor1221@gmail.com>

pkgname=reddish-shift-bin
_pkgname="${pkgname%-bin}"
pkgver=0.1.1
_pkgsrc="$_pkgname-$pkgver"
pkgrel=1
pkgdesc="Set color temperature of display according to time of day"
url="https://github.com/mahor1221/reddish-shift"
license=(GPL3)
arch=(x86_64 aarch64)
depends=(gcc-libs glibc)
conflicts=("$_pkgname")
source_aarch64=("$_pkgsrc-aarch64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-aarch64-unknown-linux-gnu.tar.gz")
source_x86_64=("$_pkgsrc-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('9e8ef672aa61e851ec991bf4fd2bb6e938fc1a518774ce8447aff69c05c52ac8')
sha256sums_aarch64=('dc6430bc344f2036ad2963f551ad01d87a4d8da02258fffc082f46d1ebf6a95d')

package() {
    install -vDm755 "$_pkgname" -t "$pkgdir/usr/bin/"
    install -vDm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname/"
    install -vDm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname/"
    install -vDm644 CHANGELOG.md -t "$pkgdir/usr/share/doc/$_pkgname/"
    install -vDm644 "_$_pkgname" "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
    install -vDm644 "$_pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
    install -vDm644 "$_pkgname.fish" "$pkgdir/usr/share/fish/completions/$_pkgname.fish"
}
