# Maintainer: FraV1982 <consulenza.vangi@libero.it>

pkgname=filezilla-server
pkgver=1.5.1
pkgrel=2
pkgdesc="A simple FTP, FTPS or SFTP server for ArchLinux."
arch=('x86_64')
url="https://filezilla-project.org/download.php?type=server"
license=('GPL3')
depends=()
optdepends=('firefox')

options=(!strip)

_debname=FileZilla_Server_${pkgver}_x86_64-linux-gnu.deb

source=(https://download.filezilla-project.org/server/FileZilla_Server_${pkgver}_x86_64-linux-gnu.deb)
sha256sums=('236066c83aea912eeebee3dd794c57389e6d0ee23a5bd8619dee387b88f89fc0')

prepare() {
  cd "$srcdir"
  msg2 "Decompressing Debian package..."
  ar xv "${_debname}" > /dev/null
  tar -xf data.tar.xz > /dev/null
}

package() {
  cd "$srcdir"
  cp -dpr --no-preserve=ownership {etc,opt,usr} "$pkgdir"
}
