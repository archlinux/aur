# Maintainer: novica <nnovica@gmail.com>

pkgname=arf-bin
pkgver=0.4.3 # renovate: datasource=github-tags depName=eitsupi/arf
pkgrel=1
pkgdesc="A modern R console"
arch=('x86_64')
url="https://github.com/eitsupi/arf"
license=('MIT')
depends=('glibc' 'libgcc')
conflicts=('arf')
options=('!debug')
provides_x86_64=("arf=${pkgver}")
source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://github.com/eitsupi/arf/releases/download/v${pkgver}/arf-console-x86_64-unknown-linux-gnu.tar.xz"
                "https://raw.githubusercontent.com/eitsupi/arf/refs/tags/v${pkgver}/LICENSE.md")

package() {
    cd "$srcdir"

    # Move the binary from the temporary install directory to the final location
    install -Dm755 "$srcdir/arf-console-x86_64-unknown-linux-gnu/arf" "$pkgdir/usr/bin/arf"
    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

sha256sums_x86_64=('f55c5fac04c0b591494f3f2007be224b7c123a68179a1c10ad4e61d3dc204772'
                   'b9ee24794ec15953578fd5d07bb323b47a01f03b6fd206429dbe34b1c638fa0f')
