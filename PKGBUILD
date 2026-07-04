# Maintainer: novica <nnovica@gmail.com>

pkgname=rd2qmd-bin
pkgver=0.3.0 # renovate: datasource=github-tags depName=eitsupi/rd2qmd
pkgrel=1
pkgdesc="A fast Rd-to-Quarto Markdown converter with intelligent link resolution. "
arch=('x86_64')
url="https://github.com/eitsupi/rd2qmd"
license=('MIT')
depends=('glibc' 'libgcc')
conflicts=('rd2qmd')
options=('!debug')
provides_x86_64=("rd2qmd=${pkgver}")
source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://github.com/eitsupi/rd2qmd/releases/download/v${pkgver}/rd2qmd-x86_64-unknown-linux-gnu.tar.xz"
                "https://raw.githubusercontent.com/eitsupi/rd2qmd/refs/tags/v${pkgver}/LICENSE.md")

package() {
    cd "$srcdir"

    # Move the binary from the temporary install directory to the final location
    install -Dm755 "$srcdir/rd2qmd-x86_64-unknown-linux-gnu/rd2qmd" "$pkgdir/usr/bin/rd2qmd"
    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

sha256sums_x86_64=('968f91d7fc0f2dfe29bdf7a42609e3c960b6975b0c3af9c2c3e76c0c700105b6'
                   '1638fb54637ac20a35be392deaae32f54cf234a9c9b9ffc3177a2ba10750ea33')
