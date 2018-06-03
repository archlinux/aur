# Contributor: Jian Zeng <anonymousknight96 AT gmail.com>

pkgname=cayley
pkgver=0.7.4
pkgrel=1
pkgdesc="Cayley is an open-source graph inspired by the graph database behind Freebase and Google's Knowledge Graph."
arch=('i686' 'x86_64')
url='https://cayley.io/'
license=('APACHE-2.0')
source_x86_64=("https://github.com/cayleygraph/cayley/releases/download/v${pkgver}/cayley_${pkgver}_linux_amd64.tar.gz")
source_i686=("https://github.com/cayleygraph/cayley/releases/download/v${pkgver}/cayley_${pkgver}_linux_386.tar.gz")
sha256sums_i686=('90d181d2fe0cae0b8022e3ee0d218dbd865e48e4bdd87ec2918004b9d738e2d6')
sha256sums_x86_64=('7363420188bf8f0f437d42c0f4c3b0fdd35786527be27d9b619f0ab59f0ad64c')

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
