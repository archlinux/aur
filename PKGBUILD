# Maintainer: Bryan Gilbert <gilbertw1 at gmail dot com>
pkgname=collate-notes
pkgver=0.2.4
pkgrel=1
pkgdesc="A flexible, locally hosted, cross-platform note-taking application"
arch=('x86_64')
url="https://collatenotes.com"
license=('Commercial')
depends=()
source=("https://s3.amazonaws.com/collate/$pkgver/linux/Collate_${pkgver}_amd64.deb")
sha256sums=('4382a98d543e2f38a6c4e8cc50b448c810959d532a4da7d92729b5b752bf9c64')

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
