# Maintainer:  Marcin Wieczorek <marcin@marcin.co>
# Contributor: Stefan Tatschner <rumpelsepp@sevenbyte.org>

pkgname=git-ftp
pkgver=1.2.0
pkgrel=1
pkgdesc='Git powered FTP client written as shell script'
url='https://github.com/git-ftp/git-ftp'
arch=('any')
license=('GPL')
depends=('curl' 'git')
makedepends=('ruby-ronn')
source=("https://github.com/git-ftp/git-ftp/archive/${pkgver}.tar.gz")
sha256sums=('c0279c85f3f8533eb47e24d3ba9055af3804c613cc9076b7901bf7a1da82a95c')

build() {
  cd $pkgname-$pkgver/man
  make man-ronn
}

package() {
  cd $pkgname-$pkgver

  install -D "git-ftp" "${pkgdir}/usr/bin/git-ftp"
  install -D "man/git-ftp.1" "${pkgdir}/usr/share/man/man1/git-ftp.1"
}
