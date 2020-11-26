# Maintainer: Alex Hirzel <alex at hirzel period us>
# Contributor: Jian Zeng <anonymousknight96 AT gmail.com>

pkgname=cayley
pkgver=0.7.7
pkgrel=2
pkgdesc="An open-source graph inspired by the graph database behind Freebase and Google's Knowledge Graph."
arch=('i686' 'x86_64')
url='https://cayley.io/'
license=('Apache')
source_x86_64=("https://github.com/cayleygraph/cayley/releases/download/v${pkgver}/cayley_${pkgver}_linux_amd64.tar.gz")
source_i686=("https://github.com/cayleygraph/cayley/releases/download/v${pkgver}/cayley_${pkgver}_linux_386.tar.gz")
md5sums_i686=('6c1e29a6481f5874bdf9e3c7440f4362')
md5sums_x86_64=('43bd3a5cadeb1bdda80cfc09c47512ad')

if [ "$CARCH" == 'x86_64' ]; then
    _dir="${pkgname}_${pkgver}_linux_amd64"
elif [ "$CARCH" == 'i686' ]; then
    _dir="${pkgname}_${pkgver}_linux_386"
fi

package() {
  cd "$_dir" || exit 1
  install -Dm755 cayley "$pkgdir/usr/bin/cayley"
  mkdir -p "$pkgdir/usr/share/doc/$pkgname/"
  rm cayley LICENSE
  cp -r ./* "$pkgdir/usr/share/doc/$pkgname/"
}
