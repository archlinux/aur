# Maintainer: novica <nnovica@gmail.com>

pkgname=q2-bin
pkgver=0.9.0 # renovate: datasource=github-tags depName=quarto-dev/q2
pkgrel=1
pkgdesc="Quarto 2 [experimental]"
arch=('x86_64')
url="https://github.com/quarto-dev/q2"
license=('MIT')
depends=('glibc' 'libgcc')
conflicts=('q2')
options=('!debug')
provides_x86_64=("q2=${pkgver}")

source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://github.com/quarto-dev/q2/releases/download/v${pkgver}/q2-${pkgver}-linux_amd64.tar.gz"
                "https://raw.githubusercontent.com/quarto-dev/q2/refs/tags/v${pkgver}/LICENSE")

package() {
    cd "$srcdir"

    # Move the binary from the temporary install directory to the final location
    install -Dm755 "$srcdir/q2" "$pkgdir/usr/bin/q2"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha256sums_x86_64=('058fbf9960c3a015eb88f299d2efa1a724d3113657354ff4c1296f0c57e771bd'
                   'ea2890b709b444613cf7ae578b3ba6d4ca03a31899207ed5936ebbc532e433b9')
