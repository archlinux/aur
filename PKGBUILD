# Maintainer: Christopher Woodruff <cswoodruff@gmail.com>
pkgname=python2-port-for
pkgver=0.3.1
pkgrel=1
pkgdesc="Utility that helps with local TCP ports managment. It can find an unused TCP localhost port and remember the association."
arch=('any')
url="https://github.com/kmike/port-for/"
license=('custom')
groups=()
depends=()
makedepends=('python2')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(
  https://pypi.python.org/packages/ec/f1/e7d7a36b5f3e77fba587ae3ea4791512ffff74bc1d065d6185e463279bc4/port-for-0.3.1.tar.gz
)
md5sums=('e6f4c466ce82fc9e9e0cb8ddee26a4c7')

package() {
  cd "$srcdir/port-for-$pkgver"

  #sed -i "s/sphinx-build/sphinx-build2/" sphinx_autobuild/__init__.py

  python2 setup.py install --root="$pkgdir/" --optimize=1

  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
