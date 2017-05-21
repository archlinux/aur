# Maintainer: Bryan Gilbert <gilbertw1 at gmail dot com>
pkgname=collate-notes
pkgver=0.3.2
pkgrel=1
pkgdesc="A flexible, locally hosted, cross-platform note-taking application"
arch=('x86_64')
url="https://collatenotes.com"
license=('Commercial')
depends=()
source=("https://s3.us-east-2.amazonaws.com/collate-releases/$pkgver/linux/Collate_${pkgver}_amd64.deb")
sha256sums=('e28bd1b74703235803cb90c0318ef0dd5af732a2dfa5dc83a5c5c886f7a9e9be')

package() {
  # Extract the core package
  tar -xf data.tar.xz -C "${pkgdir}"

  # Setup usr folder
  chmod -R go-w ${pkgdir}/usr
  mkdir -p ${pkgdir}/usr/bin

  # Setup the start script and permissions
  ln -s /opt/Collate/collate ${pkgdir}/usr/bin/collate

  install -d ${pkgdir}/usr/share/applications
  install -d ${pkgdir}/usr/share/icons
  install -d ${pkgdir}/usr/share/doc
  install -d ${pkgdir}/opt/Collate
}
