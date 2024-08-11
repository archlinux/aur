# Maintainer: Julian Brost <julian@0x4a42.net>

pkgname=dnsviz
pkgver=0.10.0
pkgrel=1
pkgdesc="Tool suite for analysis and visualization of DNS and DNSSEC"
arch=('any')
url="https://github.com/dnsviz/dnsviz"
license=('GPL-2.0-or-later')
makedepends=('python-setuptools')
depends=('python' 'python-dnspython' 'python-pygraphviz' 'python-cryptography')
optdepends=('bind: needed for some options involving zone files'
            'openssl-gost-engine: GOST support'
            'python-m2crypto: GOST support')
options=(!emptydirs)
source=("https://github.com/dnsviz/dnsviz/releases/download/v$pkgver/dnsviz-$pkgver.tar.gz"
        "https://github.com/dnsviz/dnsviz/releases/download/v$pkgver/dnsviz-$pkgver.tar.gz.asc")
sha256sums=('8e2c4d0636296acf704f7eca1ca8fea98b022c920c5517b39dfdc982ce685cd3'
            'SKIP')
validpgpkeys=(# Casey Deccio <casey@deccio.net>
              '048D0B43891D7E7BCCAAEF011ED2ED92118571E6')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
