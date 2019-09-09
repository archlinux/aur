# Maintainer:  Marcin Wieczorek <marcin@marcin.co>
# Contributor: Stefan Tatschner <rumpelsepp@sevenbyte.org>

pkgname=git-ftp
pkgver=1.5.2
pkgrel=1
pkgdesc='Git powered FTP client written as shell script'
url='https://github.com/git-ftp/git-ftp'
arch=('any')
license=('GPL')
depends=('curl' 'git')
makedepends=('pandoc')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/git-ftp/git-ftp/archive/${pkgver}.tar.gz")
sha256sums=('a6bf52f6f1d30c4d8f52fd0fbd61dc9f32e66099e3e9c4994bec65094305605b')

build() {
  cd $pkgname-$pkgver/man
  make man
}

package() {
  cd $pkgname-$pkgver

  install -D "git-ftp" "${pkgdir}/usr/bin/git-ftp"
  install -D "man/git-ftp.1" "${pkgdir}/usr/share/man/man1/git-ftp.1"
}
