# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: FraV1982 <consulenza.vangi@libero.it>

pkgname=filezilla-server-bin
pkgver=1.6.7
pkgrel=1
pkgdesc="A simple FTP, FTPS or SFTP server for ArchLinux"
arch=(x86_64)
url="https://filezilla-project.org/download.php?type=server"
license=(AGPL3)
depends=(glibc gcc-libs libxcrypt-compat)
optdepends=(gtk2 gdk-pixbuf2 libsm)
provides=(filezilla-server)
conflicts=(filezilla-server)
options=(!strip)
source_x86_64=(https://download.filezilla-project.org/server/FileZilla_Server_${pkgver}_x86_64-linux-gnu.deb)
sha256sums_x86_64=('db55ad5a11bf98a995cb384a2499f3b4f83557cd67c1a83ae018c408d8f14eaf')

package() {
  cd "$srcdir"
  bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}/
  install -d ${pkgdir}/usr/lib/systemd/system/
  mv ${pkgdir}/etc/systemd/system/filezilla-server.service ${pkgdir}/usr/lib/systemd/system/
  rm -r ${pkgdir}/etc
}
