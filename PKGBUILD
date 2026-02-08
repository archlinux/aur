# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: FraV1982 <consulenza.vangi@libero.it>

pkgname=filezilla-server-bin
pkgver=1.12.1
pkgrel=1
pkgdesc="A simple FTP, FTPS or SFTP server"
arch=(x86_64)
url="https://filezilla-project.org/download.php?type=server"
license=(AGPL3)
depends=(glibc gcc-libs libxcrypt-compat)
optdepends=(gtk2 gdk-pixbuf2 libsm)
provides=(filezilla-server)
conflicts=(filezilla-server)
options=(!strip)
#source_x86_64=(https://download.filezilla-project.org/server/FileZilla_Server_${pkgver}_x86_64-linux-gnu.deb)
source=("https://sourceforge.net/projects/fabiololix-os-archive/files/src/FileZilla_Server_${pkgver}_x86_64-linux-gnu.deb")
sha512sums=('c24b6b18272508a6f638c433750c4c34289e0a0f7ecf5671914c58f814338e4d44be3499fa7ccfde0fd1b88e791118046bbdaff5db9e72fdebc4c0ed3eebc034')

package() {
  bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}/

  #install -d ${pkgdir}/usr/lib/systemd/system/
  #mv ${pkgdir}/etc/systemd/system/filezilla-server.service ${pkgdir}/usr/lib/systemd/system/
  #rm -r ${pkgdir}/etc

  rm -r ${pkgdir}/usr/share/doc
  rm -r ${pkgdir}/usr/share/lintian
}
