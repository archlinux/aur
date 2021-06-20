# Maintainer: malacology
# Contributor: malacology

pkgname=tiger1
pkgver=1.02
pkgrel=1
pkgdesc="Identifying rapidly-evolving characters in evolutionary data"
arch=('x86_64')
url="http://mcinerneylab.com/software/tiger/",""
license=('GPL3')
depends=(
	'python2>=2.6'
)
source=("https://github.com/starsareintherose/tiger/releases/download/${pkgver}/tiger_unix_${pkgver}.zip")
md5sums=('a9984eb7fcf41b0f6ea63b8a49e7b6a9')

package() {
  install -dm755 "$pkgdir"/usr/{bin,share/tiger}
  chmod +x *
  install -Dm755 "$srcdir"/tiger_unix_${pkgver}/tiger "$pkgdir"/usr/bin
  install -Dm755 "$srcdir"/tiger_unix_${pkgver}/tiger_fns_102.py "$pkgdir"/usr/bin
  mv "$srcdir"/tiger_unix_${pkgver}/* "$pkgdir"/usr/share/tiger
}
# For using Python2
# cd /usr/bin
# sudo rm python
# sudo ln -s python2 python
