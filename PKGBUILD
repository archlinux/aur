# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Gregory Meyer <greg@gkmweb.com>

pkgname=gkrellmwireless
pkgver=2.0.3
pkgrel=2
pkgdesc="Gkrellm plugin that monitors the signal quality of your wireless networking card"
url="http://gkrellm.luon.net/gkrellmwireless.phtml"
license="GPL"
arch=('i686' 'x86_64')
depends=('gkrellm' 'gtk2')
source=("http://gkrellm.luon.net/files/$pkgname-$pkgver.tar.gz")
md5sums=('42ee66a43eb3da5af9f13d3d10d354f6')

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 wireless.so "$pkgdir/usr/lib/gkrellm2/plugins/wireless.so"
}
