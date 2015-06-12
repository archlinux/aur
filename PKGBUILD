# Contributor: Alexander 'hatred' Drozdov <adrozdoff at gmail dot com>
# Maintainer: jose 1711 gmail com

pkgname=gkrellm-hddtemp
_pkgver=0.2-beta
pkgver=0.2_beta
pkgrel=3
pkgdesc="A hddtemp plugin for gkrellm2"
license=('GPL')
arch=('i686' 'x86_64')
depends=('gkrellm' 'hddtemp>=0.3.beta')
source=(http://www.guzu.net/files/$pkgname-$_pkgver.tar.gz)
url="http://www.guzu.net/linux/hddtemp.php"
md5sums=('b4f3b90692acbce1f74cac05ce2264fa')

build() {
  cd $srcdir/$pkgname-$_pkgver
  sed -i 's/-Wl//g' Makefile
  make gkrellm2
}

package() {
  cd $srcdir/$pkgname-$_pkgver
  install -D -m755 gkrellm-hddtemp.so \
      $pkgdir/usr/lib/gkrellm2/plugins/gkrellm-hddtemp.so
}
