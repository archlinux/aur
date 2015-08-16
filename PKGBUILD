# Maintainer: Artem Klevtsov <a.a.klevtsov at gmail dot com>

pkgname=python2-flickrsmartsync-git
_pkgname=flickrsmartsync
pkgver=0.2.1.r69.a0515ce
pkgrel=1
pkgdesc="Sync/backup your photos to flickr easily"
arch=('any')
url="https://github.com/faisalraja/flickrsmartsync"
license=('MIT')
depends=('python2' 'python2-watchdog' 'python2-iptcinfo')
makedepends=('python2-setuptools' 'git')
source=("git://github.com/faisalraja/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "$(python2 setup.py -V).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"
  python2 setup.py install --root="$pkgdir"
}
