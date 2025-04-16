# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Aaron DeVore <aaron.devore@gmail.com>
# Contributor: Michael Fellinger <m.fellinger@gmail.com>

pkgname=diakonos
pkgver=0.9.12
pkgrel=1
pkgdesc="A Linux console text editor for the masses."
arch=('any')
depends=('ruby-curses')
makedepends=('git')
license=('MIT')
url="https://git.sr.ht/~pistos/diakonos"
source=("git+$url#commit=882251ed8f0406973e80d67956fd6a2d5c7fc923")
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

