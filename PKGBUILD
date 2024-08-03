# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
pkgname=python-pretty-errors
pkgver=1.2.25
pkgrel=1
pkgdesc="Prettifies Python exception output to make it legible."
arch=(any)
url="https://github.com/onelivesleft/PrettyErrors/"
license=(MIT)
depends=('python' 'python-colorama')
makedepends=("python-pip")
build() {
  pip install --no-deps --target="pretty-errors" pretty-errors==1.2.25
}
package() {
  sitepackages=$(python -c "import site; print(site.getsitepackages()[0])")
  mkdir -p $pkgdir/"$sitepackages"
  cp -r $srcdir/pretty-errors/* $pkgdir/"$sitepackages"
}
