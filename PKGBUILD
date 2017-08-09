# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=duplicity-fuse-git
pkgver=r5.db6f039
pkgrel=1
pkgdesc="mount duplicity backup as virtual filesystem via FUSE"
url="https://github.com/jose1711/duplicity-fuse"
arch=('any')
license=('GPL2')

depends=('python2-fuse')
md5sums=('SKIP')

source=("${pkgname}"::'git://github.com/jose1711/duplicity-fuse.git')

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $srcdir/$pkgname
  install -D -m755 ./duplicity-fuse.py $pkgdir/usr/bin/duplicity-fuse.py
}
