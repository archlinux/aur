# Contributor: Jian Zeng <anonymousknight96 AT gmail.com>

pkgname=cayley
pkgver=0.7.5
pkgrel=1
pkgdesc="Cayley is an open-source graph inspired by the graph database behind Freebase and Google's Knowledge Graph."
arch=('i686' 'x86_64')
url='https://cayley.io/'
license=('APACHE-2.0')
source_x86_64=("https://github.com/cayleygraph/cayley/releases/download/v${pkgver}/cayley_${pkgver}_linux_amd64.tar.gz")
source_i686=("https://github.com/cayleygraph/cayley/releases/download/v${pkgver}/cayley_${pkgver}_linux_386.tar.gz")
sha256sums_i686=('155cf7ee36c6898f267e7a4991bcf86125a226b959c9d95aaf992be75c277a5f')
sha256sums_x86_64=('69c1fa786a98c1531d6362d760a6c1777a0b39dc5b3a4b8be680492a177e02af')

if [ "$CARCH" == 'x86_64' ]; then
    _dir="${pkgname}_${pkgver}_linux_amd64"
elif [ "$CARCH" == 'i686' ]; then
    _dir="${pkgname}_${pkgver}_linux_386"
fi

package() {
  cd "$_dir" || exit 1
  install -Dm755 cayley "$pkgdir/usr/bin/cayley"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  mkdir -p "$pkgdir/usr/share/doc/$pkgname/"
  rm cayley LICENSE
  cp -r ./* "$pkgdir/usr/share/doc/$pkgname/"
}
