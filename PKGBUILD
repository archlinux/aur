pkgname=python-ccxt
pkgver=1.24.37
pkgrel=1
pkgdesc="A JavaScript / Python / PHP cryptocurrency trading library with support for 130+ exchanges"
arch=(any)
url="https://ccxt.trade"
license=(MIT)
makedepends=("python" "python-pip")
build() {
  pip install --no-deps --target="ccxt" ccxt==1.24.37
}
package() {
  sitepackages=$(python -c "import site; print(site.getsitepackages()[0])")
  mkdir -p $pkgdir/"$sitepackages"
  cp -r $srcdir/ccxt/* $pkgdir/"$sitepackages"
}
