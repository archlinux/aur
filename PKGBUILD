# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: FraV1982 <consulenza.vangi@libero.it>

pkgname=filezilla-server-bin
pkgver=1.10.2
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
sha512sums=('b15ec074559933fe0d23eb7bad02269e7c0bb3fdec16c71d6d5d86a199c80bbb3ab27e4d241550d07be479881a22f12d8849daa31e8fc5a4383fc05e56e7c6db')

package() {
  bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}/

  #install -d ${pkgdir}/usr/lib/systemd/system/
  #mv ${pkgdir}/etc/systemd/system/filezilla-server.service ${pkgdir}/usr/lib/systemd/system/
  #rm -r ${pkgdir}/etc

  rm -r ${pkgdir}/usr/share/doc
  rm -r ${pkgdir}/usr/share/lintian
}
