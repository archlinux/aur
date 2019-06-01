# Maintainer: Jan Máslo <janmaslo {at} atlas {dot} cz>

pkgname=yell-git
pkgver=1.0
pkgrel=1
pkgdesc="Common word URL shortener"
arch=('any')
url="https://gitlab.com/maslic/yell.sh"
license=('MIT')
depends=('bash' 'curl')
makedepends=('git')
provides=('yell')

source=(${pkgname%.sh}::git+https://gitlab.com/maslic/yell.sh.git)

md5sums=('SKIP') #autofill using updpkgsums

package() {
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"

  cp "$srcdir/$pkgname/yell.sh" "$pkgdir/usr/bin/yell"
  cp "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

