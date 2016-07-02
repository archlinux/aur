#Maintainer: Kirill Gagarski <kirill.gagarski [at] gmail.com>
pkgname=gi-bash-completion

pkgver=0.0.3
pkgrel=1
pkgdesc="Bash completion support for gi"
arch=('any')
url="https://bitbucket.org/gagarski/gi-bash-completion"
license=('GPL')
makedepends=('git')
depends=('gi' 'bash-completion')
provides=('gi-bash-completion')
conflicts=('gi-bash-completion')
install=
source=(git+https://gagarski@bitbucket.org/gagarski/$pkgname.git#tag=$pkgver)
md5sums=('SKIP')


package() {
  cd "$srcdir/$pkgname"
  git checkout $pkgver

  mkdir -p "$pkgdir/usr/share/bash-completion/completions/"
  cp $srcdir/$pkgname/gi "$pkgdir/usr/share/bash-completion/completions/"
}
