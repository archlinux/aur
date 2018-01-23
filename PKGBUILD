# Maintainer: Julian Brost <julian@0x4a42.net>

pkgname=dnsviz
pkgver=0.6.7
pkgrel=1
pkgdesc="Tool suite for analysis and visualization of DNS and DNSSEC"
arch=('any')
url="https://github.com/dnsviz/dnsviz"
license=('GPL')
depends=('python2' 'python2-dnspython' 'python2-pygraphviz' 'python2-m2crypto')
optdepends=('python2-libnacl: verify ed25519 signatures'
            'bind: needed for some options involving zone files')
options=(!emptydirs)
source=("https://github.com/dnsviz/dnsviz/releases/download/v0.6.7/dnsviz-$pkgver-js.tar.gz"
        "https://github.com/dnsviz/dnsviz/releases/download/v0.6.7/dnsviz-$pkgver-js.tar.gz.asc")
sha256sums=('34d4583fd01b9fc6de82ef94560cb52fbe8388e33392feee65e633211b031136'
            'SKIP')
validpgpkeys=(# Casey Deccio <casey@deccio.net>
              '048D0B43891D7E7BCCAAEF011ED2ED92118571E6')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
