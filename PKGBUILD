# Maintainer: Bryan Gilbert <gilbertw1 at gmail dot com>
pkgname=collate-notes
pkgver=0.2.3
pkgrel=1
pkgdesc="A flexible, locally hosted, cross-platform note-taking application"
arch=('x86_64')
url="https://collatenotes.com"
license=('Commercial')
depends=()
source=("https://s3.amazonaws.com/collate/0.2.3/linux/Collate_0.2.3_amd64.deb")
sha256sums=('4fba82232ca6fc2ed8f61207b71b0c512cd2c32edac5432dc77131b3da3c4db1')

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
