# Maintainer: novica <nnovica@gmail.com>

pkgname=arity-bin
pkgver=0.27.0 # renovate: datasource=github-releases depName=jolars/arity
pkgrel=1
pkgdesc="Language server, formatter, and linter for R"
arch=('x86_64')
url="https://github.com/jolars/arity"
license=('MIT')
depends=('glibc')
conflicts=('arity')
options=('!debug')
provides_x86_64=("arity=${pkgver}")

source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://github.com/jolars/arity/releases/download/v${pkgver}/arity-x86_64-unknown-linux-gnu.tar.gz"
                "https://raw.githubusercontent.com/jolars/arity/refs/tags/v${pkgver}/LICENSE")

package() {
    cd "$srcdir"

    # Move the binary from the temporary install directory to the final location
    install -Dm755 "$srcdir/arity" "$pkgdir/usr/bin/arity"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha256sums_x86_64=('76a262cfe49d50a4f419ee5dd7be205b15335e06d906a4a9d5934f9c039f5f54'
                   'c350265d5a2d04f8ba0f19ada3936c9d1003be9ef55192e2a85f2580e3e45b41')
