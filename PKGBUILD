# Maintainer: mutantmonkey <aur@mutantmonkey.in>
pkgname=fteproxy
pkgver=0.2.16
pkgrel=2
pkgdesc="A tool that provides transport-layer protection to resist censorship"
arch=('any')
url="https://fteproxy.org/"
license=('GPL')
depends=('python2' 'python2-pyptlib' 'python2-crypto' 'python2-fte' 'obfsproxy'
         'twisted')
makedepends=('python2-setuptools')
optdepends=('tor: to use fteproxy as a pluggable transport')
source=("https://fteproxy.org/dist/${pkgver}/fteproxy-${pkgver}-src.tar.gz"{,.asc})
sha256sums=('77083975036c3d5beb30dc989b0150903da30f7a1449986140b4d232fa62b43d'
            'SKIP')

package() {
  cd "$srcdir/$pkgname-$pkgver-src"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
