pkgname=stegosaurus
pkgver=1.0
pkgrel=1
pkgdesc='A steganography tool for embedding payloads within Python bytecode.'
url='https://github.com/AngelKitty/stegosaurus'
arch=('any')
license=('ISC')
depends=('python')
source=(https://github.com/AngelKitty/$pkgname/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('c6804dd97f1aee132e5cd4e5191c57296532aa482f6617f20590c75117a1c9e4806fed532013356f66f436de9677d2a30c8c648d7a79cad6d98dd8ae5009fd50')

package() {
  cd $pkgname-$pkgver

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -vDm 644 stegosaurus.py -t "$pkgdir/$site_packages"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
