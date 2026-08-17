# Maintainer: ParticleG <particle_g@outlook.com>

pkgname=ompweb
pkgver=0.3.1
pkgrel=2
pkgdesc='Web UI for the oh-my-pi coding agent'
arch=('x86_64')
url='https://github.com/kahme247/ompweb'
license=('MIT')
depends=('nodejs>=22.19.0' 'oh-my-pi')
options=('!strip' '!debug')

_bundle_sha256='1f7601edb7cc60290f4d414da4f8b65714d4e3c1b60a79ca0c257bdb1097bc0e'
_bundle="$pkgname-$pkgver-x86_64.tar.gz"
source=("$_bundle::https://github.com/ParticleG/ompweb/releases/download/bundle-v$pkgver-$_bundle_sha256/$_bundle")
sha256sums=("$_bundle_sha256")

package() {
  install -d "$pkgdir/usr/lib/node_modules/@kahme247"
  cp -a "$srcdir/ompweb" \
    "$pkgdir/usr/lib/node_modules/@kahme247/ompweb"

  install -d "$pkgdir/usr/bin"
  ln -s "../lib/node_modules/@kahme247/ompweb/bin/omp-web.js" \
    "$pkgdir/usr/bin/ompweb"

  install -Dm644 \
    "$srcdir/ompweb/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
