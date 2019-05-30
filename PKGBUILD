# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)
# Contributor : stoneo

pkgname=rdcli-git
pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --tags | sed 's/^v//;s/\([^-]*-\)g/r\1g/;s/-/./g'
}
pkgver=1.5.1.r5.g275e953
pkgrel=1

pkgdesc="A simple CLI tool to unrestrict links with real-debrid.com"
arch=('any')
url="https://github.com/stoneo/rdcli"
license=('GPL3')

provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
depends=('nodejs')
makedepends=('git' 'npm')

#noextract=("$pkgname-${pkgver%-git}.tgz")

source=("${pkgname%-git}::git+https://github.com/ston3o/${pkgname%-git}")
sha256sums=('SKIP')

package() {
  cd "${pkgname%-git}"
  npm install -g --user root --prefix "$pkgdir/usr" "${pkgname%-git}"
}

# vim: ts=2 sw=2 et ft=PKGBUILD:
