# Maintainer: Sean Brar <contact@seanbrar.com>
pkgname=igir-bin
pkgver=4.2.0
pkgrel=2
pkgdesc="A zero-setup ROM collection manager"
arch=('x86_64')
url="https://github.com/emmercm/igir"
license=('GPL-3.0-only')
provides=("igir")
conflicts=("igir")

# Disable stripping to prevent corruption of the igir binary.
# Stripping modifies the binary in a way that causes runtime errors.
options=(!strip !debug)

source=("igir-$pkgver-Linux-amd64.tar.gz::https://github.com/emmercm/igir/releases/download/v$pkgver/igir-$pkgver-Linux-amd64.tar.gz"
        "LICENSE::https://raw.githubusercontent.com/emmercm/igir/v$pkgver/LICENSE")
sha256sums=('94082a7e8869908065a457e2b4794ca42bcbbb3a556d11a8a8f9daaa44b088e3'
            'SKIP')

package() {
    cd "$srcdir"

    # Install the binary into /usr/bin
    install -Dm755 "igir" "$pkgdir/usr/bin/igir"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
