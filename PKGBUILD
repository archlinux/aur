# Maintainer gilcu3 <gilcu3 at gmail dot com>
# Contributor: D. Can Celasun <can[at]dcc[dot]im>
# Contributor: Dmitry Batenkov <dima dot batenkov at gmail dot com>

pkgname=rabbitvcs-thunar
pkgver=0.19
pkgrel=1
pkgdesc="Thunar front-end for RabbitVCS SVN GIT HG Extension."
#_gitcommit='c424618cc15686a902a0255cdf6751647dd39b19'
arch=('any')
url="https://github.com/rabbitvcs/rabbitvcs"
install=$pkgname.install
depends=('python-thunarx' 'python-dbus' "rabbitvcs>=$pkgver")
license=('GPL')
if [ "${_gitcommit}" != "" ]; then
  source=("rabbitvcs-$pkgver-$pkgrel.tar.gz::$url/archive/$_gitcommit.tar.gz")
else
  source=("rabbitvcs-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
fi
sha256sums=('83deaafb1e95f4eae9cf083ba2296507c909540cbcb5a0616ee0dd9dbf903e74')


build() {
  if [ "$_gitcommit" != "" ]; then
    mv "$srcdir/rabbitvcs-$_gitcommit" "$srcdir/rabbitvcs-$pkgver"
  fi
}

package(){
	install -Dm755 "$srcdir/rabbitvcs-$pkgver/clients/thunar/RabbitVCS.py" "$pkgdir/usr/share/thunarx-python/extensions/RabbitVCS.py"
}
