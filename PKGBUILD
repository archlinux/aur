# Maintainer: Alan Berndt <alan@eatabrick.org>
pkgname=gfk
pkgver=0.0.3
pkgrel=1
pkgdesc="Securely share files between computers with a USB drive"
url="http://gfk.eatabrick.org/"
license='MIT'
arch=('any')
depends=('secretfs')
provides=('gfk')
source=('https://github.com/bentglasstube/gfk/archive/v0.0.3.tar.gz')
sha1sums=('76edc377c3dfa185440174d1214801a23fb34208')

build() {
  true # literally nothing to do
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 gfk.conf "${pkgdir}/etc/gfk.conf"
}
