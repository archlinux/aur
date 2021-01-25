pkgname=python-ccxt
pkgver=1.40.98
pkgrel=1
pkgdesc="A JavaScript / Python / PHP cryptocurrency trading library with support for 130+ exchanges"
arch=(any)
url="https://ccxt.trade"
license=(MIT)
depends=("python")
makedepends=("python-pip")


build() {
  pip install --no-deps --target="ccxt" ccxt==1.40.98
}
package() {
  sitepackages=$(python -c "import site; print(site.getsitepackages()[0])")
  mkdir -p $pkgdir/"$sitepackages"
  mkdir -p $pkgdir/usr/share/licenses/python-ccxt/
  cp -r $srcdir/ccxt/* $pkgdir/"$sitepackages"
  cp $srcdir/ccxt/ccxt-$pkgver.dist-info/LICENSE.txt $pkgdir/usr/share/licenses/python-ccxt/
}
