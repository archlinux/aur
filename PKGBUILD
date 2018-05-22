# Maintainer:  Marcin Wieczorek <marcin@marcin.co>
# Contributor: Stefan Tatschner <rumpelsepp@sevenbyte.org>

pkgname=git-ftp
pkgver=1.5.1
pkgrel=1
pkgdesc='Git powered FTP client written as shell script'
url='https://github.com/git-ftp/git-ftp'
arch=('any')
license=('GPL')
depends=('curl' 'git')
makedepends=('pandoc')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/git-ftp/git-ftp/archive/${pkgver}.tar.gz")
sha256sums=('8cca25e1f718b987ea22ec05c7d72522f21cacedd00a8a0e827f87cd68e101f0')

build() {
  cd $pkgname-$pkgver/man
  make man
}

package() {
  cd $pkgname-$pkgver

  install -D "git-ftp" "${pkgdir}/usr/bin/git-ftp"
  install -D "man/git-ftp.1" "${pkgdir}/usr/share/man/man1/git-ftp.1"
}
