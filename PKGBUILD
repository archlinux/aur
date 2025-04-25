# Maintainer: Laura Demkowicz-Duffy <dev[at]demkowiczduffy.co.uk>
pkgname=zigup-bin
_pkgname=zigup
pkgver=v2025_04_20
pkgrel=1
pkgdesc="Download and manage zig compilers"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/marler8997/zigup"
license=('MIT-0')
provides=('zigup' 'zig')
conflicts=('zigup' 'zig')
install="$_pkgname.install"
source=("$url/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=("$url/releases/download/$pkgver/zigup-x86_64-linux.tar.gz")
source_aarch64=("$url/releases/download/$pkgver/zigup-aarch64-linux.tar.gz")
source_armv7h=("$url/releases/download/$pkgver/zigup-arm-linux.tar.gz")
sha256sums=('3fabc75f05c7a80a9a19f7d79f3529c208db6303ffd1b3b0328e070fc6703654')
sha256sums_x86_64=('edfb37ea013ae7269c6d994fe3462fa19d15d9c357c0287e2b1f95a212c533f9')
sha256sums_aarch64=('a4fb26b456645ed6acbbba55313fe49abee9a4b02aff769e9219e5755cb93361')
sha256sums_armv7h=('11f2a8008669fc54ccd7c5c0d4a98331529f21be12c02a495db66e6edb46b7d1')

package() {
    install -Dm 0755 $_pkgname $pkgdir/usr/bin/$_pkgname

    cd "$_pkgname-$(echo $pkgver | sed 's/^v//')"
    install -Dm 0644 README.md $pkgdir/usr/share/doc/$pkgname/README.md
    install -Dm 0644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
