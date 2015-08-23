# Maintainer: John Jenkins <twodopeshaggy@gmail.com>

_pkgname=define
pkgname=define-git
pkgver=r23.4a27365
pkgrel=1
pkgdesc="Terminal dictionary"
arch=('any')
url="https://github.com/SethDusek/define"
license=('BSD')
depends=('python2' 'python2-wget' 'python2-wordnik' 'python2-requests')
makedepends=('git')
source=('git://github.com/SethDusek/define.git')
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
  cd "$srcdir/$_pkgname"
  sed -i -e 's/python/python2/' define.py
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 define.py "${pkgdir}/usr/bin/define"
  install -Dm644 LICENSE "${pkgdir}/usr/share/doc/define/LICENSE"
  install -Dm644 define.1 "${pkgdir}/usr/share/man/man1/define.1"
}
