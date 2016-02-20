# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=lazylibrarian-git
_gitname=LazyLibrarian
pkgver=736.d66f7e9
pkgrel=1
pkgdesc="Automatic Book Downloading via NZBs & Torrent"
arch=('any')
url="https://github.com/DobyTang/LazyLibrarian"
license=('GPL3')
depends=('python2')
makedepends=('git')
install='lazylibrarian.install'
source=('git://github.com/DobyTang/LazyLibrarian.git' 'lazylibrarian.service')
sha256sums=('SKIP' '5010608e99e0242ba7c74b401efed0968984fd9a0ba1b9995dca22d6b8da8519')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  mkdir -p "${pkgdir}/opt/"
  cp -r "$srcdir/$_gitname" "${pkgdir}/opt/lazylibrarian"

  install -Dm644 "${srcdir}/lazylibrarian.service" "${pkgdir}/usr/lib/systemd/system/lazylibrarian.service"
}
