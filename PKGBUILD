# Maintainer: Filipe Laíns (FFY00) <filipe.lains@gmail.com>
# Contributor: defkeh <defkeh@gmail.com>

pkgname=rivalcfg
_mver=3.0.0
_bver=beta1
_gver=$_mver-$_bver
pkgver=$_mver.$_bver
pkgrel=1
pkgdesc='SteelSeries Rival gaming mouse configuration utility'
arch=('any')
url='https://github.com/flozz/rivalcfg'
license=('custom:WTFPL')
depends=('python' 'hidapi' 'python-hidapi')
makedepends=('git' 'python-setuptools')
conflicts=('rivalcfg')
provides=('rivalcfg')
source=("https://github.com/flozz/rivalcfg/archive/v$_gver.tar.gz")
sha256sums=('a9b1a8e3e4368bbe7dc0db5251451e1f3a9997e1874300174408f47f1cbc25ef')
install=$pkgname.install

package() {
  cd $srcdir/$pkgname-$_gver
  python setup.py install --root=$pkgdir --prefix=/usr --optimize=1
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -D -m644 doc/rival-spec.md $pkgdir/usr/share/doc/$pkgname/rival-spec.md
  install -D -m644 doc/rival100-spec.md $pkgdir/usr/share/doc/$pkgname/rival-spec100.md
  install -D -m644 doc/rival300-spec.md $pkgdir/usr/share/doc/$pkgname/rival-spec300.md
  install -D -m644 $pkgname/data/99-steelseries-rival.rules $pkgdir/etc/udev/rules.d/99-steelseries-rival.rules
}
