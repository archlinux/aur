# Maintainer: mutantmonkey <aur@mutantmonkey.in>
pkgname=fteproxy
pkgver=0.2.18
pkgrel=1
pkgdesc="A tool that provides transport-layer protection to resist censorship"
arch=('any')
url="https://fteproxy.org/"
license=('GPL')
depends=('python2' 'python2-pyptlib' 'python2-crypto' 'python2-fte' 'obfsproxy'
         'twisted')
makedepends=('python2-setuptools')
optdepends=('tor: to use fteproxy as a pluggable transport')
source=("https://fteproxy.org/dist/${pkgver}/fteproxy-${pkgver}-src.tar.gz"{,.asc})
sha256sums=('4c8493525cafaea73240fbcd072e9290c14916b277ae6e58d98576fb9ac41073'
            'SKIP')

package() {
  cd "$srcdir/$pkgname-$pkgver-src"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
