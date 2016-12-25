# Maintainer: Tristan Rice <rice@fn.lc>
pkgname=gimme-git
pkgver=r211.1752cb8
pkgrel=1
pkgdesc="gimme is a shell script that knows how to install go. Fancy!"
arch=('any')
url="https://github.com/travis-ci/gimme"
license=('MIT')
depends=()
makedepends=('git')
backup=()
source=("$pkgname"::'git+https://github.com/travis-ci/gimme.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
   cd "$srcdir/$pkgname"
   install -D -m644 "gimme" "${pkgdir}/usr/bin/gimme"
   chmod +x "${pkgdir}/usr/bin/gimme"
   install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
