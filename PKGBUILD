pkgname=python-coinmarketcap
pkgver=5.0.3
pkgrel=1
pkgdesc="Python wrapper around the coinmarketcap.com API."
arch=(any)
url="https://github.com/barnumbirr/coinmarketcap"
license=(Apache v2.0 License)
makedepends=("python" "python-pip")
build() {
  pip install --no-deps --target="coinmarketcap" coinmarketcap==5.0.3
}
package() {
  sitepackages=$(python -c "import site; print(site.getsitepackages()[0])")
  mkdir -p $pkgdir/"$sitepackages"
  cp -r $srcdir/coinmarketcap/* $pkgdir/"$sitepackages"
}
