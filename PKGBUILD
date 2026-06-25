# Maintainer: novica <nnovica@gmail.com>

pkgname=uvr-bin
pkgver=0.3.13 # renovate: datasource=github-tags depName=nbafrank/uvr
pkgrel=1
pkgdesc="An extremely fast R package and project manager"
arch=('x86_64')
url="https://github.com/nbafrank/uvr"
license=('MIT')
depends=(
    libgcc
    glibc
    xz
)
conflicts=('uvr')
options=('!debug')
provides_x86_64=("uvr=${pkgver}")
source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://github.com/nbafrank/uvr/releases/download/v${pkgver}/uvr-x86_64-unknown-linux-gnu.tar.gz"
                "https://raw.githubusercontent.com/nbafrank/uvr/refs/tags/v${pkgver}/LICENSE")

package() {
    cd "$srcdir"

    # Move the binary from the temporary install directory to the final location
    install -Dm755 "$srcdir/uvr" "$pkgdir/usr/bin/uvr"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha256sums_x86_64=('056077d060a4a01088cb94ff00b98120f0ed7fe0e01d81c8ba117680824585de'
                   '77b70ed5d9b61311ad9b3be2940e7bc5491600d0a28a641eb801991690d4debc')
