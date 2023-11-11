# Maintainer: Tobias Boesch <tobias.boesch at googlemail.com>

pkgname=('fs2-knossos-dotnet-bin')
pkgver=v0.2.0_RC5
pkgrel=2
pkgdesc="A multi platform launcher for Freespace 2 Open using .NET 6.0 and AvaloniaUI"
arch=('x86_64')
url='https://github.com/KnossosNET/Knossos.NET'
license=('GPL3')
depends=(
  'zlib'
  'gcc-libs'
  'glibc'
  'hicolor-icon-theme'
)
source=($url/releases/download/v0.2.0-RC5/Linux_x64.tar.gz
https://raw.githubusercontent.com/KnossosNET/Knossos.NET/main/packaging/linux/knossos-256.png
        'Knossos.Net.desktop')
sha512sums=(SKIP  # Skipped - since no checksums are provided by upstream yet.
            '8d9cc22539d7328ef3e43197d292c5ce8c45a6c39fc41b389a5414ceb11b9c5fff39b967882be95a70788c993f32eb44c8bb5d15ec9cf697f7e031e6cc9d57cc'
            'a6845989dde5579533796059425c2ceef5752e0dd59a2afc3b58c80f61a3ed8e6b1b646db7082931292ade0c8005ae3cc0ca49466755412d6c79ce241505a4eb')
options=(
  !strip # Stripping file Knossos.NET seems to destroy it
)

package() {
  install -D -m755 "${srcdir}/Knossos.NET" "${pkgdir}/usr/bin/Knossos.NET"
  install -D -m644 "${srcdir}/knossos-256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/Knossos.NET.png"
  install -D -m644 "${srcdir}/Knossos.Net.desktop" "${pkgdir}/usr/share/applications/Knossos.Net.desktop"
}
