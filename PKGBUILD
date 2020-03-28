# Maintainer gilcu3 <gilcu3 at gmail dot com>
# Contributor: D. Can Celasun <can[at]dcc[dot]im>
# Contributor: Dmitry Batenkov <dima dot batenkov at gmail dot com>

pkgname=rabbitvcs-thunar
pkgver=0.18.0
pkgrel=1
pkgdesc="Thunar front-end for RabbitVCS SVN GIT HG Extension."
_gitcommit='e44328e01ed82dd8a8dbfec952f5982e355b8416'
arch=('any')
url="https://github.com/rabbitvcs/rabbitvcs"
install=$pkgname.install
depends=('thunarx-python' 'python-dbus' "rabbitvcs>=$pkgver")
license=('GPL')
if [ "${_gitcommit}" != "" ]; then
  source=("rabbitvcs-$pkgver-$pkgrel.tar.gz::$url/archive/$_gitcommit.tar.gz")
else
  source=("rabbitvcs-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
fi
sha256sums=('a9f59d0eff65526887f719eb72712eac7d7aaa84cf9993c7b69b7b17b0b13143')
#sha256sums=('SKIP')


build() {
  if [ "$_gitcommit" != "" ]; then
    mv "$srcdir/rabbitvcs-$_gitcommit" "$srcdir/rabbitvcs-$pkgver"
  fi
}

package(){
	install -Dm755 "$srcdir/rabbitvcs-$pkgver/clients/thunar/RabbitVCS.py" "$pkgdir/usr/lib/thunarx-3/python/RabbitVCS.py"
}
