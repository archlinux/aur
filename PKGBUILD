# Maintainer: Yufan You <ouuansteve at gmail>
# Contributor: William Di Luigi <williamdiluigi@gmail.com>

pkgname=testlib
pkgver=0.9.41
pkgrel=2
pkgdesc='C++ library to develop competitive programming problems'
arch=('any')
url='https://github.com/MikeMirzayanov/testlib'
license=('MIT')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('749709b96b76c0f0492841aa08278b7b5daa34d099ab3095f36ec796a790baac')

package() {
  cd "$pkgname-$pkgver"

  install -Dm644 testlib.h -t "$pkgdir/usr/include"

  for dir in checkers generators interactors validators; do
    install -Dm644 $dir/*.cpp -t "$pkgdir/usr/share/$pkgname/$dir"
  done

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
