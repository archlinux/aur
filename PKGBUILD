# Maintainer: Sindre Moen <sindrenm@gmail.com>
pkgname=ndenv
pkgver=0.4.0
pkgrel=1
pkgdesc="node.js version manager based on rbenv"
arch=("any")
url="https://github.com/riywo/ndenv"
license=("MIT")
depends=()
optdepends=("node-build")
conflicts=()
install="ndenv.install"
noextract=("v${pkgver}")
source=("$url/tarball/v${pkgver}")
md5sums=("23d771641452a224ae5527fb2c4f916d")

build() {
    cd $srcdir

    tar -x --strip-components 1 -zf "v$pkgver"
}

package() {
  cd $srcdir

  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/doc/$pkgname
  mkdir -p $pkgdir/usr/lib/ndenv/completions
  mkdir -p $pkgdir/usr/lib/ndenv/libexec

  install -m 644 ./README.md $pkgdir/usr/share/doc/$pkgname
  install -m 644 ./completions/* $pkgdir/usr/lib/ndenv/completions/
  install -m 755 ./libexec/* $pkgdir/usr/lib/ndenv/libexec/

  ln -s /usr/lib/ndenv/libexec/ndenv $pkgdir/usr/bin/
}

