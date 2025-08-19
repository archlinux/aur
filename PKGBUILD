# Maintainer: Laura Demkowicz-Duffy <dev[at]demkowiczduffy.co.uk>
pkgname=zigup-bin
_pkgname=zigup
pkgver=2025_05_24
pkgrel=2
epoch=1
pkgdesc="Download and manage zig compilers"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/marler8997/zigup"
license=('MIT-0')
provides=('zigup')
conflicts=('zigup')
install="$_pkgname.install"
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
source_x86_64=("$url/releases/download/v$pkgver/zigup-x86_64-linux.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/zigup-aarch64-linux.tar.gz")
source_armv7h=("$url/releases/download/v$pkgver/zigup-arm-linux.tar.gz")
sha256sums=('d88e6d9c9629c88aba78c3bae2fb89ae4bea11f2818911f6d5559e7e79bcae69')
sha256sums_x86_64=('1cd459fb8d83e3967eb6b97c30d1929427f3401167cdd5c5bac54aa56acbe4f4')
sha256sums_aarch64=('a4c6f259b957dd0e31dc0adf217f6301f42ebef2c23481c9fac4c14dad77a5ca')
sha256sums_armv7h=('fe6e30b421453c147866d9286288de42cf308c88e186f3eff187523a982a908c')

package() {
    install -Dm 0755 $_pkgname $pkgdir/usr/bin/$_pkgname

    cd "$_pkgname-$pkgver"
    install -Dm 0644 README.md $pkgdir/usr/share/doc/$pkgname/README.md
    install -Dm 0644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
