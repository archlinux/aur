# Maintainer: Victor Perevozchikov webmaster@victor3d.com.br
pkgname=obmenu2-git
pkgver=r20.d5261ef
pkgrel=2
pkgdesc='Openbox menu editor. Written in Python 3 and GTK3'
arch=('any')
url="https://github.com/0x10/obmenu2"
license=('MIT')
depends=('python3' 'python-gobject' 'gtk3')
makedepends=('git')
conflicts=('obmenu' 'obmenu3')
source=('git+https://github.com/0x10/obmenu2')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/obmenu2"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  mkdir -p ${pkgdir}/usr/bin/
  cd "$srcdir/obmenu2"
  cp -r obmenu2 "$pkgdir/usr/bin/obmenu"
  chmod +x ${pkgdir}/usr/bin/obmenu
  sed -i 's/python3.7/python3/g' ${pkgdir}/usr/bin/obmenu
}

