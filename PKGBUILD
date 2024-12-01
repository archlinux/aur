# Python package author: nlfmt <nlfmt@gmx.de>
# Maintainer: Ondrej Dohnal <dohnal@douball.eu>
pkgname=python-vcolorpicker
pkgver=1.4.4
pkgrel=1
pkgdesc="Open a visual vcolorpicker from any project."
arch=(any)
url="https://github.com/nlfmt/pyqt-colorpicker"
license=(MIT)
makedepends=("python" "python-pip")
build() {
  pip install --no-deps --target="vcolorpicker" vcolorpicker==1.4.4
}
package() {
  sitepackages=$(python -c "import site; print(site.getsitepackages()[0])")
  mkdir -p $pkgdir/"$sitepackages"
  cp -r $srcdir/vcolorpicker/* $pkgdir/"$sitepackages"
}
