# Maintainer: Tobias Boesch <tobias.boesch at googlemail.com>

pkgname=('fs2-knossos-dotnet-bin')
pkgver=v0.2.0_RC5
pkgrel=1
pkgdesc="A multi platform launcher for Freespace 2 Open using .NET 6.0 and AvaloniaUI"
arch=('x86_64')
url='https://github.com/KnossosNET/Knossos.NET'
license=('GPL3')
depends=(
  'dotnet-runtime-6.0'
  'gcc-libs'
  'glibc'
)
source=($url/releases/download/v0.2.0-RC5/Linux_x64.tar.gz
        'Knossos.Net.desktop')
sha512sums=(SKIP  # Skipped - since no checksums are provided by upstream yet.
            SKIP)
options=(
  !strip # Stripping file Knossos.NET seems to destroy it
)

package() {
  install -D -m755 "${srcdir}/Knossos.NET" "${pkgdir}/usr/bin/Knossos.NET"
  install -D -m644 "${srcdir}/Knossos.Net.desktop" "${pkgdir}/usr/share/applications/Knossos.Net.desktop"
}
