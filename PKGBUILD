# Maintainer: novica <nnovica@gmail.com>

pkgname=arity-bin
pkgver=0.12.0 # renovate: datasource=github-tags depName=jolars/arity
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

sha256sums_x86_64=('4f5fc36606320922ed86dca0afe3f690ebcf1d9e4e0c908c3a7736b367b447d6'
                   'c350265d5a2d04f8ba0f19ada3936c9d1003be9ef55192e2a85f2580e3e45b41')
