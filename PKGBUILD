# Maintainer gilcu3 <gilcu3 at gmail dot com>
# Contributor: D. Can Celasun <can[at]dcc[dot]im>
# Contributor: Dmitry Batenkov <dima dot batenkov at gmail dot com>

pkgname=rabbitvcs-thunar
pkgver=0.18.0
pkgrel=4
pkgdesc="Thunar front-end for RabbitVCS SVN GIT HG Extension."
_gitcommit='c424618cc15686a902a0255cdf6751647dd39b19'
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
sha256sums=('8490b98370b0d93590ea4d5180eefb5c350763427c6251ea52a87e16aed62865')


build() {
  if [ "$_gitcommit" != "" ]; then
    mv "$srcdir/rabbitvcs-$_gitcommit" "$srcdir/rabbitvcs-$pkgver"
  fi
}

package(){
	install -Dm755 "$srcdir/rabbitvcs-$pkgver/clients/thunar/RabbitVCS.py" "$pkgdir/usr/share/thunarx-python/extensions/RabbitVCS.py"
}
