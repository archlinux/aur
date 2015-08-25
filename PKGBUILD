# Maintainer: John Jenkins <twodopeshaggy@gmail.com>

_pkgname=google-cli
pkgname=google-cli
pkgver=1.1
pkgrel=1
pkgdesc="Google Search from command line"
arch=('any')
url="https://github.com/jarun/google-cli"
license=('GPL3')
depends=('python2')
conflicts=('google-cli-git')
source=("https://github.com/jarun/google-cli/archive/v$pkgver.tar.gz")
md5sums=('d62b7909ef8bac354b0c7267ade34969')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  sed -i -e 's/python/python2/' google
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -Dm755 google "${pkgdir}/usr/bin/google"
  install -Dm644 google.1 "${pkgdir}/usr/share/man/man1/google.1"
}
