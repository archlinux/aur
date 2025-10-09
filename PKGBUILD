# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: FraV1982 <consulenza.vangi@libero.it>

pkgname=filezilla-server-bin
pkgver=1.11.1
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
sha512sums=('66e71de645c892ef974dd5a4c2f948b21cd423a786254c0791e35d4e0a8e0a16d00b7fa5a6ee25e57fbb3c9d265f301565ccdebb86999a15e83b3664cd602222')

package() {
  bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}/

  #install -d ${pkgdir}/usr/lib/systemd/system/
  #mv ${pkgdir}/etc/systemd/system/filezilla-server.service ${pkgdir}/usr/lib/systemd/system/
  #rm -r ${pkgdir}/etc

  rm -r ${pkgdir}/usr/share/doc
  rm -r ${pkgdir}/usr/share/lintian
}
