# Maintainer:  Peter Mattern <pmattern at arcor dot de>

_pkgname=filezilla
pkgname=$_pkgname-svn
pkgver=7250
pkgrel=1
pkgdesc="Free, open source FTP, FTPS and SFTP client"
arch=("i686" "x86_64")
url="https://filezilla-project.org"
license=("GPL")
depends=("libfilezilla" "pugixml" "wxgtk" "xdg-utils")
makedepends=("subversion")
provides=("$_pkgname")
conflicts=("$_pkgname")
install=$pkgname.install
source=("$_pkgname::svn+https://svn.filezilla-project.org/svn/FileZilla3/trunk")
sha256sums=("SKIP")

pkgver() {
    cd $_pkgname
    svnversion
}

build() {
    cd $_pkgname
    autoreconf -i
    ./configure --prefix=/usr
    make
}

package() {
    cd $_pkgname
    make DESTDIR=$pkgdir install
}
