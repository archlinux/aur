# $Id: PKGBUILD,v 1.15 2006/05/22 17:38:11 uid1014 Exp $
# Maintainer: my64 <package@obordes.com>
# Contributor: Sarah Hay <sarahhay@mb.symptico.ca>

pkgname=gkrellm-volume
pkgver=2.1.13
pkgrel=5
pkgdesc="A volume control plugin for gkrellm2"
arch=('i686' 'x86_64')
depends=('gkrellm' 'gtk2')
license=('GPL')
source=(http://gkrellm.luon.net/files/$pkgname-$pkgver.tar.gz)
url="http://gkrellm.luon.net/volume.phtml"
md5sums=('d9f4c36d7fdf9c9f755c99f742b573c4')

build() {
  cd $srcdir/$pkgname
  /usr/bin/make enable_alsa=1 || return 1
}

package() {
  cd $srcdir/$pkgname
  /bin/install -D -m755 volume.so \
      $pkgdir/usr/lib/gkrellm2/plugins/volume.so
}
# vim: ts=2 sw=2 et ft=sh
