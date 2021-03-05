# Maintainer: Charles Cabergs me@cacharle.xyz
pkgbase=norminette-old
pkgname=norminette-old
pkgver=0.0.0
pkgrel=1
pkgdesc="Previous non open source version of school 42's norminette (C code linter)"
arch=('any')
url='https://github.com/42Paris/norminette'
# license=''
depends=('ruby')
makedepends=('git' 'ruby-bundler')
source=("$pkgname"::'git+https://github.com/42Paris/norminette.git')
md5sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    bundle
}

package() {
    dest="$pkgdir/usr/bin/norminette-old"
    mkdir -p "$(dirname "$dest")"
    ln -sv "$srcdir/$pkgname/norminette.rb" "$dest"
}
