# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: FraV1982 <consulenza.vangi@libero.it>

pkgname=filezilla-server-bin
pkgver=1.9.4
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
sha512sums=('7e89423e9856f260d0624db17c20581863dc169a100a532664e53b80f744b5d5814545806210bab57e1c92ce984732471aca88a10fe5db22500dae3216e99a16')

package() {
  bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}/

  #install -d ${pkgdir}/usr/lib/systemd/system/
  #mv ${pkgdir}/etc/systemd/system/filezilla-server.service ${pkgdir}/usr/lib/systemd/system/
  #rm -r ${pkgdir}/etc

  rm -r ${pkgdir}/usr/share/doc
  rm -r ${pkgdir}/usr/share/lintian
}
