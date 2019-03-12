# Maintainer: Julian Brost <julian@0x4a42.net>

pkgname=dnsviz
pkgver=0.8.1
pkgrel=1
pkgdesc="Tool suite for analysis and visualization of DNS and DNSSEC"
arch=('any')
url="https://github.com/dnsviz/dnsviz"
license=('GPL')
depends=('python' 'python-dnspython' 'python-pygraphviz' 'python-m2crypto' 'python-libnacl')
optdepends=('bind: needed for some options involving zone files')
options=(!emptydirs)
source=("https://github.com/dnsviz/dnsviz/releases/download/v$pkgver/dnsviz-$pkgver.tar.gz"
        "https://github.com/dnsviz/dnsviz/releases/download/v$pkgver/dnsviz-$pkgver.tar.gz.asc")
sha256sums=('b62e6642aba46cf145f9ca23d02fcfd101752a7448d1b44537334ddc4e359eae'
            'SKIP')
validpgpkeys=(# Casey Deccio <casey@deccio.net>
              '048D0B43891D7E7BCCAAEF011ED2ED92118571E6')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
