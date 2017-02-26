# Maintainer:  Marcin Wieczorek <marcin@marcin.co>
# Contributor: Stefan Tatschner <rumpelsepp@sevenbyte.org>

pkgname=git-ftp
pkgver=1.3.2
pkgrel=1
pkgdesc='Git powered FTP client written as shell script'
url='https://github.com/git-ftp/git-ftp'
arch=('any')
license=('GPL')
depends=('curl' 'git')
makedepends=('ruby-ronn')
source=("https://github.com/git-ftp/git-ftp/archive/${pkgver}.tar.gz")
sha256sums=('a86e2437e60ab4314874a2da71fe330f0a892ed1c9b038b97f755c4b68d60dd1')

build() {
  cd $pkgname-$pkgver/man
  make man-ronn
}

package() {
  cd $pkgname-$pkgver

  install -D "git-ftp" "${pkgdir}/usr/bin/git-ftp"
  install -D "man/git-ftp.1" "${pkgdir}/usr/share/man/man1/git-ftp.1"
}
