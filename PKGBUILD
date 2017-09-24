# Maintainer: Zeph <zeph33@gmail.com>

pkgname=rabbitvcs-nemo
pkgdesc="Nemo front-end for rabbitvcs SVN GIT HG Extension."
pkgver=0.17.1
pkgrel=1
arch=('any')
url="https://github.com/rabbitvcs/rabbitvcs"
install=$pkgname.install
depends=('nemo-python>=2.0' 'python2-dbus' "rabbitvcs>=$pkgver")
license=('GPL')
_gitcommit=""
if [ "${_gitcommit}" != "" ]; then
  source=("rabbitvcs-$pkgver-$pkgrel.tar.gz::$url/archive/$_gitcommit.tar.gz")
else
  source=("rabbitvcs-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
fi
md5sums=('95b7c30945f10333588a39b5f6766136')
#md5sums=('SKIP')


build() {
  if [ "$_gitcommit" != "" ]; then
    mv "$srcdir/rabbitvcs-$_gitcommit" "$srcdir/rabbitvcs-$pkgver"
  fi
}

package(){
	install -D "$srcdir/rabbitvcs-$pkgver/clients/nemo/RabbitVCS.py" "$pkgdir/usr/share/nemo-python/extensions/RabbitVCS.py"
}
