# Maintainer: Tristan Rice <rice@fn.lc>
# Maintainer: Dan Buch <dan@meatballhat.com>
pkgname=gimme-git
pkgver=v1.7.1
pkgrel=1
pkgdesc="gimme is a shell script that knows how to install go. Fancy!"
arch=('any')
url="https://github.com/urfave/gimme"
license=('MIT')
depends=()
makedepends=('git')
backup=()
source=("$pkgname"::'git+https://github.com/urfave/gimme.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --always --dirty --tags
}

package() {
   cd "$srcdir/$pkgname"
   install -D -m644 "gimme" "${pkgdir}/usr/bin/gimme"
   chmod +x "${pkgdir}/usr/bin/gimme"
   install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
