# Maintainer: Olivier Le Moal <mail at olivierlemoal dot fr>
# Contributor: Jan Ypma <jan at ypmania dot nl>
pkgname=jjazzlab-bin
pkgver=5.0.1
pkgrel=1
pkgdesc="A complete and open application dedicated to backing tracks generation."
arch=('x86_64' 'aarch64')
url="https://www.jjazzlab.org/"
depends=('fluidsynth')
license=('LGPL-2.1-or-later')
source=("https://github.com/jjazzboss/JJazzLab/releases/download/${pkgver}/JJazzLab-${pkgver}-linux-x64.tar.xz" "jjazzlab.desktop")
sha256sums=('5fa0235909c2081129e7d126cb5e7dc36a3aa4eff75ae1543f0ad3d6033a424a'
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
