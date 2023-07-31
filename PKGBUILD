# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Brian Bidulock
# Contributor: Gregory Meyer

pkgname=gkrellmwireless
pkgver=2.0.3
pkgrel=3
pkgdesc="Gkrellm plugin that monitors the signal quality of your wireless networking card"
url="https://web.archive.org/web/20161027062505/http://gkrellm.luon.net/gkrellmwireless.php"
license=("GPL")
arch=('i686' 'x86_64')
depends=('gkrellm' 'gtk2')
source=("https://web.archive.org/web/20160323095658/http://gkrellm.luon.net/files/gkrellmwireless-${pkgver}.tar.gz")
md5sums=('42ee66a43eb3da5af9f13d3d10d354f6')

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 wireless.so "$pkgdir/usr/lib/gkrellm2/plugins/wireless.so"
}
