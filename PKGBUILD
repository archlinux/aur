# Maintainer: Reed Law <reed@lawlap.top>
# Python package author: Karl Voit <tools@Karl-Voit.at>
pkgname=python-filetags
pkgver=2019.12.22.1
pkgrel=1
pkgdesc="Management of simple tags within file names"
arch=(any)
url="https://github.com/novoid/filetags"
license=('GPL')
depends=('python' 'python-clint')
makedepends=('python-pip')
build() {
  pip install --no-deps --target="filetags" filetags==2019.12.22.1
}
package() {
  sitepackages=$(python -c "import site; print(site.getsitepackages()[0])")
  mkdir -p $pkgdir/"$sitepackages"
  cp -r $srcdir/filetags/* $pkgdir/"$sitepackages"
  mkdir -p "$pkgdir/usr/bin"
  ln -s "$sitepackages"/bin/filetags $pkgdir/usr/bin/filetags
}