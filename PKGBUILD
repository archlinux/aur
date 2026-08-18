# Maintainer: Cleboost <clement.balarot@gmail.com>
# Contributor: missing-aur project <https://github.com/Cleboost/missing-aur>

pkgname=psst-bin
pkgver=2026.08.17_cbd099e
pkgrel=1
pkgdesc="Fast and multi-platform Spotify client with native GUI (precompiled binary)"
url="https://github.com/jpochyla/psst"
arch=("x86_64")
depends=("gtk3" "alsa-lib" "openssl")
provides=("psst")
conflicts=("psst" "psst-git" "psst-git-bin")
license=("MIT")

source=("psst-${pkgver}::${url}/releases/download/rolling/psst-linux-x86_64" "psst.desktop::https://raw.githubusercontent.com/jpochyla/psst/refs/heads/main/.pkg/psst.desktop" "psst.png::https://raw.githubusercontent.com/jpochyla/psst/main/psst-gui/assets/logo_512.png")
sha256sums=('716d1fb76affb74b547acefdaf9b22d16220832d0157dec748f7b42b20238acb'
            'ca6cd059c7cb16806d9f75b4c754de0916c888af1697d8e8250a3956be4265ae'
            'da79acff7d35ef5c51ee6a516c852a4ad75e84ba83d3a0fbe789d677e627ebaf')

package() {
  install -Dm755 "psst-${pkgver}" "${pkgdir}/usr/bin/psst"
  ln -s psst "${pkgdir}/usr/bin/psst-gui"
  install -Dm644 psst.desktop "${pkgdir}/usr/share/applications/psst.desktop"
  install -Dm644 psst.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/psst.png"
}

