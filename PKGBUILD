# Maintainer: Sean Brar <contact@seanbrar.com>
pkgname=igir-bin
pkgver=3.0.1
pkgrel=2
pkgdesc="A zero-setup ROM collection manager"
arch=('x86_64')
url="https://github.com/emmercm/igir"
license=('GPL3')
provides=("igir")
conflicts=("igir")

# Disable stripping to prevent corruption of the igir binary.
# Stripping modifies the binary in a way that causes runtime errors.
options=(!strip)

source=("igir-$pkgver-Linux-amd64.tar.gz::https://github.com/emmercm/igir/releases/download/v$pkgver/igir-$pkgver-Linux-amd64.tar.gz"
        "LICENSE::https://raw.githubusercontent.com/emmercm/igir/v$pkgver/LICENSE")
sha256sums=('41b40120d79197227e38bb17974c471121ff07c1f4df24dae095f38fefa623d6'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

package() {
    cd "$srcdir"

    # Install the binary into /usr/bin
    install -Dm755 "igir" "$pkgdir/usr/bin/igir"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}