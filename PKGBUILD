# Maintainer: criptixo <therealcriptixo@gmail.com>
pkgname=waveterm-bin
pkgver=0.5
pkgrel=1
pkgdesc='an open-source, cross-platform terminal for seamless workflows'
arch=('x86_64')
url="https://www.waveterm.dev"
license=('GPL')
depends=('pacman')
makedepends=('unzip')
source=("https://github.com/wavetermdev/waveterm/releases/download/v0.5.0/waveterm-linux-x64-v0.5.0.zip")
sha256sums=('ddb454bbcc18175eb01784fce9246aa48870c3099460627609b4cf8b47aad0ae')

package() {
  
  # bin
  mkdir -p ${pkgdir}/opt/waveterm
  cp -r ${srcdir}/Wave-linux-x64/* ${pkgdir}/opt/waveterm/
  chmod +x ${pkgdir}/opt/waveterm/Wave
  mv ${pkgdir}/opt/waveterm/Wave ${pkgdir}/opt/waveterm/waveterm
  mkdir -p ${pkgdir}/usr/bin/
  ln -s ${pkgdir}/opt/waveterm/waveterm ${pkgdir}/usr/bin/waveterm

  # license
  mkdir -p ${pkgdir}/usr/share/licenses/waveterm
  cp -r ${srcdir}/Wave-linux-x64/LICENSE ${pkgdir}/usr/share/licenses/waveterm/LICENSE

  # desktop icon and entry
  mkdir -p ${pkgdir}/usr/share/pixmaps/
  cp -r ${srcdir}/Wave-linux-x64/resources/app/public/waveterm.icns ${pkgdir}/usr/share/pixmaps/waveterm.icns
  mkdir -p ${pkgdir}/usr/share/applications/
  ln -s /opt/waveterm/waveterm ${pkgdir}/usr/share/applications/waveterm.desktop
}
