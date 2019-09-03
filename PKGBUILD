#Maintainer: Kirill Gagarski <kirill.gagarski [at] gmail.com>
pkgname=gi-zsh-completion

pkgver=0.1.3
pkgrel=2
pkgdesc="Zsh completion support for gi"
arch=('any')
url="https://github.com/gagarski/gi-zsh-completion"
license=('custom')
makedepends=('python-setuptools' 'git')
depends=('gi' 'zsh' 'zsh-completions')
provides=('gi-zsh-completion')
conflicts=('gi-zsh-completion')
install=
source=(git+https://github.com/gagarski/$pkgname.git#tag=$pkgver)
md5sums=('SKIP')


package() {
  cd "$srcdir/$pkgname"
  git checkout $pkgver

  install -m0755 -d "$pkgdir"/usr/share/zsh/site-functions
  install -m0644 _gi "$pkgdir"/usr/share/zsh/site-functions
  install -m0755 -d "$pkgdir"/usr/share/licenses/$pkgname/
  install -m0644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/
}
