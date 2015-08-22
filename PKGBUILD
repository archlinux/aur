# Maintainer: John Jenkins <twodopeshaggy@gmail.com>

_pkgname=google-cli
pkgname=google-cli
pkgver=1.0
pkgrel=1
pkgdesc="Google Search from command line"
arch=('any')
url="https://github.com/jarun/google-cli"
license=('GPL3')
depends=('python')
makedepends=('git')
conflicts=('google-cli-git')
source=("https://github.com/jarun/google-cli/archive/v$pkgver.tar.gz")
md5sums=('c43a32ff04af8a739a8c76ed50139fb7')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  sed -i -e 's/python/python2/' google
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -Dm755 google "${pkgdir}/usr/bin/google"
  install -Dm644 google.1 "${pkgdir}/usr/share/man/man1/google.1"
}
