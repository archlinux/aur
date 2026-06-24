# Maintainer: novica <nnovica@gmail.com>

pkgname=arf-bin
pkgver=0.4.1 # renovate: datasource=github-tags depName=eitsupi/arf
pkgrel=1
pkgdesc="A modern R console"
arch=('x86_64')
url="https://github.com/eitsupi/arf"
license=('MIT')
depends=('glibc' 'libgcc')
conflicts=('arf')
options=('!debug')
provides_x86_64=("arf=${pkgver}")
source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://github.com/eitsupi/arf/releases/download/v${pkgver}/arf-console-$CARCH-unknown-linux-gnu.tar.xz"
                "https://raw.githubusercontent.com/eitsupi/arf/refs/tags/v${pkgver}/LICENSE.md")

package() {
    cd "$srcdir"

    # Move the binary from the temporary install directory to the final location
    install -Dm755 "$srcdir/arf-console-$CARCH-unknown-linux-gnu/arf" "$pkgdir/usr/bin/arf"
    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

sha256sums_x86_64=('4fb53ededa9a2c33b1270581319939037327367c9923cdf636935157c3140e63'
                   'b9ee24794ec15953578fd5d07bb323b47a01f03b6fd206429dbe34b1c638fa0f')
