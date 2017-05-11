# Maintainer:  Marcin Wieczorek <marcin@marcin.co>
# Contributor: Stefan Tatschner <rumpelsepp@sevenbyte.org>

pkgname=git-ftp
pkgver=1.3.3
pkgrel=1
pkgdesc='Git powered FTP client written as shell script'
url='https://github.com/git-ftp/git-ftp'
arch=('any')
license=('GPL')
depends=('curl' 'git')
makedepends=('pandoc')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/git-ftp/git-ftp/archive/${pkgver}.tar.gz")
sha256sums=('4e36ef178b498f273dc2e9b7685d28dea69b939dcf3602fdda69d1f525e24f31')

build() {
  cd $pkgname-$pkgver/man
  make man
}

package() {
  cd $pkgname-$pkgver

  install -D "git-ftp" "${pkgdir}/usr/bin/git-ftp"
  install -D "man/git-ftp.1" "${pkgdir}/usr/share/man/man1/git-ftp.1"
}
