# Maintainer: Wayne Campbell <wcampbell1995 [at] gmail [dot] com>
#
# github url: https://github.com/mrooney/mintapi
# pypi url: https://pypi.org/project/mintapi/
pkgname=python-mint-api
pkgver=1.0.1
pkgrel=1
pkgdesc="A screen-scraping API for Mint.com"
arch=(any)
url="https://pypi.org/project/mint-api/"
license=(UNKNOWN)
makedepends=("python" "python-pip")
build() {
  pip install --no-deps --target="mint-api" mint-api==1.0.1
}
package() {
  sitepackages=$(python -c "import site; print(site.getsitepackages()[0])")
  mkdir -p $pkgdir/"$sitepackages"
  cp -r $srcdir/mint-api/* $pkgdir/"$sitepackages"
}
