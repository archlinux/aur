# Maintainer: Wayne Campbell <wcampbell1995 [at] gmail [dot] com>
# Python package author: Michael Rooney <mrooney.mintapi@rowk.com>
pkgname=python-mintapi
pkgver=1.39
pkgrel=1
pkgdesc="a screen-scraping API for Mint.com"
arch=(any)
url="https://github.com/mrooney/mintapi"
license=(The MIT License)
makedepends=("python" "python-pip")
build() {
  pip install --no-deps --target="mintapi" mintapi==1.39
}
package() {
  sitepackages=$(python -c "import site; print(site.getsitepackages()[0])")
  mkdir -p $pkgdir/"$sitepackages"
  cp -r $srcdir/mintapi/* $pkgdir/"$sitepackages"
}
