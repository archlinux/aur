# Maintainer: Reed Law <reed@lawlap.top>
# Python package author: Karl Voit <tools@Karl-Voit.at>
pkgname=python-date2name
pkgver=2018.5.9.1
pkgrel=1
pkgdesc="Handling time-stamps and date-stamps in file names"
arch=(any)
url="https://github.com/novoid/date2name"
license=('GPL')
depends=('python')
makedepends=("python" "python-pip")
build() {
  pip install --no-deps --target="date2name" date2name==2018.5.9.1
}
package() {
  sitepackages=$(python -c "import site; print(site.getsitepackages()[0])")
  mkdir -p $pkgdir/"$sitepackages"
  cp -r $srcdir/date2name/* $pkgdir/"$sitepackages"
  mkdir -p "$pkgdir/usr/bin"
  ln -s "$sitepackages"/bin/date2name $pkgdir/usr/bin/date2name
}