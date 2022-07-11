# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Aaron DeVore <aaron.devore@gmail.com>
# Contributor: Michael Fellinger <m.fellinger@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=diakonos
pkgver=0.9.8
pkgrel=1
pkgdesc="A Linux editor for the masses."
arch=('any')
depends=('ruby-curses')
makedepends=('git')
license=('MIT')
url="https://git.sr.ht/~pistos/diakonos"
source=("git+$url#commit=5f064a5d439b545d7eea360caef2b40114dd294b")
sha256sums=('SKIP')

prepare() {
  cd $pkgname
  sed -i 's+sitelibdir+vendorlibdir+' install.rb
}

package() {
  cd $pkgname
  ruby install.rb --dest-dir $pkgdir --prefix /usr --conf-dir /etc
  install -D -m644 LICENCE "$pkgdir"/usr/share/licenses/$pkgname/MIT
}

