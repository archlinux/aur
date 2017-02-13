# Maintainer: Dhruv Dang <hi@dhruv.io>
pkgname=t-git
pkgver=8b5f5fe
pkgver(){
  cd "$pkgname"
  git rev-parse --short HEAD
}
pkgrel=1
pkgdesc="A command-line todo list manager for people that want to finish tasks, not organize them."
arch=('any')
url="http://stevelosh.com/projects/t/"
license=('X11')
depends=('python>=2.5')
provides=('t', 't.py')
conflicts=('t', 't.py')
source=("$pkgname::git+https://github.com/sjl/t.git")
md5sums=('SKIP')

package() {
  cd "$pkgname"
  install -D -m0555 t.py "${pkgdir}/usr/bin/t.py"
  ln -s t.py "${pkgdir}/usr/bin/t"
  install -D -m0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
