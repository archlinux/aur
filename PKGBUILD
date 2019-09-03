#Maintainer: Kirill Gagarski <kirill.gagarski [at] gmail.com>
pkgname=gi-bash-completion

pkgver=0.1.3
pkgrel=2
pkgdesc="Bash completion support for gi"
arch=('any')
url="https://github.com/gagarski/gi-bash-completion"
license=('GPL')
makedepends=('git')
depends=('gi' 'bash-completion')
provides=('gi-bash-completion')
conflicts=('gi-bash-completion')
install=
source=(git+https://github.com/gagarski/$pkgname.git#tag=$pkgver)
md5sums=('SKIP')


package() {
  cd "$srcdir/$pkgname"
  git checkout $pkgver

  install -m0755 -d "$pkgdir/usr/share/bash-completion/completions/"
  install -m0644 $srcdir/$pkgname/gi "$pkgdir/usr/share/bash-completion/completions/"
}
