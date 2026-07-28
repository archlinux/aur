# Maintainer: novica <nnovica@gmail.com>

pkgname=uvr-bin
pkgver=0.4.3 # renovate: datasource=github-tags depName=nbafrank/uvr
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

sha256sums_x86_64=('d4fb7680a4214d210b95b067b4f232003af415bcd586b3c73b8ecd860a278bda'
                   '77b70ed5d9b61311ad9b3be2940e7bc5491600d0a28a641eb801991690d4debc')
