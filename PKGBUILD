# Maintainer: Olivier Le Moal <mail at olivierlemoal dot fr>
# Contributor: Jan Ypma <jan at ypmania dot nl>
pkgname=jjazzlab-bin
pkgver=5.0.0
pkgrel=2
pkgdesc="A complete and open application dedicated to backing tracks generation."
arch=('i686' 'x86_64' 'aarch64')
url="https://www.jjazzlab.org/"
depends=('fluidsynth')
license=('LGPL-2.1-or-later')
source=("https://github.com/jjazzboss/JJazzLab/releases/download/${pkgver}-win-linux/JJazzLab-${pkgver}.-linux.tar.xz" "jjazzlab.desktop")
sha256sums=('ab2caf309020eb7568f438f36934da2d46f8078ef16ac782a5d0f5b4eebe4057'
            '0c11ad2c50439741a43629e551b9134e51b043c8c5250e1f47768dc9b443a034')

package() {
  cd "${srcdir}/JJazzLab-${pkgver}"

  install -d "${pkgdir}/opt/jjazzlab"
  cp -rp * "${pkgdir}/opt/jjazzlab"

  install -d "${pkgdir}/usr/bin"
  ln -s /opt/jjazzlab/bin/jjazzlab ${pkgdir}/usr/bin/jjazzlab

  install -d "${pkgdir}/usr/share/applications"
  install ../jjazzlab.desktop "${pkgdir}/usr/share/applications"
}
