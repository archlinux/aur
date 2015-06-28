# Maintainer: aksr <aksr at t-com dot me>
pkgname=diakonos-git
pkgver=0.9.1.r61.gc0eadfe
pkgrel=1
pkgdesc="A Linux console text editor for the masses."
arch=('i686' 'x86_64')
url="http://diakonos.pist0s.ca/"
license=('MIT')
groups=()
depends=('ruby' 'ruby-curses')
makedepends=('git')
optdepends=()
provides=('diakonos')
conflicts=('diakonos')
replaces=()
backup=()
options=()
install=
source=("$pkgname::git+https://github.com/Pistos/diakonos.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//g'
}

package() {
  cd "$srcdir/$pkgname"
  ruby=$(test -x /usr/bin/ruby && echo /usr/bin/ruby || which ruby)
  $ruby install.rb --dest-dir $pkgdir --prefix /usr --conf-dir /etc
  install -Dm644 LICENCE $pkgdir/usr/share/licenses/diakonos/LICENCE
}

