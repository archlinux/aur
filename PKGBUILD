# Maintainer: Zeph <zeph33@gmail.com>

pkgname=rabbitvcs-nemo
pkgdesc="Nemo front-end for rabbitvcs SVN GIT HG Extension."
pkgver=0.17.3
pkgrel=1
_gitcommit='5555d67769c0af1d143a78c56ea91425caf23178'
arch=('any')
url="https://github.com/rabbitvcs/rabbitvcs"
install=$pkgname.install
depends=('nemo-python>=4.0' 'python-dbus' "rabbitvcs>=$pkgver")
license=('GPL')
if [ "${_gitcommit}" != "" ]; then
  source=("rabbitvcs-$pkgver-$pkgrel.tar.gz::$url/archive/$_gitcommit.tar.gz")
else
  source=("rabbitvcs-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
fi
sha256sums=('d5d3e038bd9d007c8ebe7289598cf66fa0f79c12dbf46e9ebd64dc1ebb8367fe')
#sha256sums=('SKIP')


build() {
  if [ "$_gitcommit" != "" ]; then
    mv "$srcdir/rabbitvcs-$_gitcommit" "$srcdir/rabbitvcs-$pkgver"
  fi
}

package(){
	install -D "$srcdir/rabbitvcs-$pkgver/clients/nemo/RabbitVCS.py" "$pkgdir/usr/share/nemo-python/extensions/RabbitVCS.py"
}
