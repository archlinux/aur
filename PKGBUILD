# Maintainer: Sean Brar <contact@seanbrar.com>
pkgname=igir-bin
pkgver=3.4.2
pkgrel=1
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
sha256sums=('33ba971545aba64798de28f9a3619d9509eec391b7a7d545a19c24478f9fc619'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

package() {
    cd "$srcdir"

    # Install the binary into /usr/bin
    install -Dm755 "igir" "$pkgdir/usr/bin/igir"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
