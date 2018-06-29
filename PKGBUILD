# Maintainer: Filipe Laíns (FFY00) <filipe.lains@gmail.com>
pkgname=python2-keyrings-alt
pkgver=3.1
pkgrel=1
pkgdesc="Alternate keyring backend implementations for use with the keyring package."
arch=('any')
url="https://github.com/jaraco/keyring"
license=('MIT')
depends=('python2-six')
makedepends=('python2-pip')
provides=('python2-keyrings-alt')
conflicts=('python2-keyrings-alt')
_csum='202fe99c9f6d75c7810cb3af7d791479df0dd942f2bac2425646c0ad3db8'
_rname=keyrings.alt
source=("https://files.pythonhosted.org/packages/f7/db/$_csum/$_rname-$pkgver-py2.py3-none-any.whl")
sha256sums=('6a00fa799baf1385cf9620bd01bcc815aa56e6970342a567bcfea0c4d21abe5f')

package() {
  PIP_CONFIG_FILE=/dev/null pip2 install --isolated --root=$pkgdir --ignore-installed --no-deps --no-warn-script-location *.whl
  python2 -O -m compileall $pkgdir/lib/python2.7/site-packages/keyring
}
