# Maintainer: yantene <contact@yantene.net>
# Maintainer: usagiga <usagiga@usagiga.me>
pkgname=anyenv
pkgver=1.1.5
pkgrel=1
pkgdesc="All in one for **env"
arch=('any')
url="https://github.com/anyenv/anyenv"
license=('MIT')
depends=()
conflicts=()
install="anyenv.install"
source=("https://github.com/anyenv/anyenv/archive/v${pkgver}.tar.gz")
md5sums=('0a39364230131b6779044701c8594723')

build() {
    cd $srcdir
    tar -x --strip-components 1 -zf "v$pkgver.tar.gz"
}

package() {
  cd $srcdir

  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/doc/$pkgname
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  mkdir -p $pkgdir/usr/lib/anyenv/completions
  mkdir -p $pkgdir/usr/lib/anyenv/libexec

  install -m 644 ./README.md $pkgdir/usr/share/doc/$pkgname
  install -m 644 ./LICENSE.txt $pkgdir/usr/share/licenses/$pkgname
  install -m 644 ./completions/* $pkgdir/usr/lib/anyenv/completions/
  install -m 755 ./libexec/* $pkgdir/usr/lib/anyenv/libexec/

  ln -s /usr/lib/anyenv/libexec/anyenv $pkgdir/usr/bin/
}
