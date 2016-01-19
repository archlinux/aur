# Maintainer: Stefan Tatschner <rumpelsepp@sevenbyte.org>

pkgname=git-ftp
pkgver=1.1.0
pkgrel=3
pkgdesc='Git powered FTP client written as shell script'
url='https://github.com/git-ftp/git-ftp'
arch=('any')
license=('GPL')
depends=('curl' 'git')
makedepends=('ruby-ronn')
source=("https://github.com/git-ftp/git-ftp/archive/${pkgver}.tar.gz")
sha256sums=('b0de6dc36db506ac25a6fda21cb33d37b6a0b205fc72b0bd96de87359defc837')

build() {
  cd $pkgname-$pkgver/man
  make man-ronn
}

package() {
  cd $pkgname-$pkgver

  install -D "git-ftp" "${pkgdir}/usr/bin/git-ftp"
  install -D "man/man1/git-ftp.1" "${pkgdir}/usr/share/man/man1/git-ftp.1"
}
