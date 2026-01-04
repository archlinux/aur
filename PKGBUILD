# Maintainer: Olivier Le Moal <mail at olivierlemoal dot fr>
# Contributor: Jan Ypma <jan at ypmania dot nl>
pkgname=jjazzlab-bin
pkgver=5.1
pkgrel=1
pkgdesc="A complete and open application dedicated to backing tracks generation."
arch=('x86_64' 'aarch64')
url="https://www.jjazzlab.org/"
depends=('fluidsynth')
license=('LGPL-2.1-or-later')
source=("https://github.com/jjazzboss/JJazzLab/releases/download/${pkgver}/JJazzLab-${pkgver}-linux-x64.tar.xz" "jjazzlab.desktop")
sha256sums=('fd70e69aeee8234c8ef469306f7da4df4fe2c89aa33d2b8aa6ce4081f9f68886'
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
