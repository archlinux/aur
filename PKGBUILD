# Maintainer: John Jenkins <twodopeshaggy@gmail.com>


_pkgname=google-cli
pkgname=google-cli-git
pkgver=r74.5bd5816
pkgrel=1
pkgdesc="Google Search from command line"
arch=('any')
url="https://github.com/jarun/google-cli"
license=('GPL3')
depends=('python')
makedepends=('git')
conflicts=('google-cli')
source=('git://github.com/jarun/google-cli.git')
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
  cd "$srcdir/$_pkgname"
  sed -i -e 's/python/python2/' google
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 google "${pkgdir}/usr/bin/google"
  install -Dm644 google.1 "${pkgdir}/usr/share/man/man1/google.1"
}
