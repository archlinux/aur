# Maintainer: Jose Riha <jose1711 [at] gmail (dot) com>

pkgname=ratarmount-git
pkgver=20190526
pkgrel=1
pkgdesc="Mount tar file using fuse with fast read-only random access"
arch=('any')
url="https://github.com/mxmlnkn/ratarmount"
license=("MIT")
depends=('python-fusepy' 'python-msgpack')
source=(git+https://github.com/mxmlnkn/ratarmount)
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  install -Dm755 "${srcdir}/ratarmount/ratarmount.py" "${pkgdir}/usr/bin/ratarmount.py"
  install -Dm755 "${srcdir}/ratarmount/README.md" "${pkgdir}/usr/share/doc/ratarmount/README.md"
}
