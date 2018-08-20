pkgname=picoc-git
pkgver=2.2
pkgrel=2
pkgdesc="A very small C interpreter for scripting."
arch=('x86_64')
url="https://gitlab.com/zsaleeba/picoc"
license=('GPL')
source=("git+https://gitlab.com/zsaleeba/picoc.git")
options=('!buildflags')
md5sums=('SKIP')
 
build() {
  cd "${srcdir}/picoc"
  sed -i.bak 's/-DVER.*$//' Makefile
  make
}
 
package() {
  cd "${srcdir}/picoc"
  install -D picoc "$pkgdir/usr/bin/picoc"
}
