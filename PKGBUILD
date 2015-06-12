# Author: Jesus Alvarez <jeezusjr@gmail.com>
pkgname=jsctags-tern-git
pkgver=0474181
pkgrel=1
pkgdesc="jsctags generator using tern"
arch=('any')
url="https://github.com/ramitos/jsctags"
license=('MIT')
depends=('nodejs')
makedepends=('git')
source=("$pkgname"::'git://github.com/ramitos/jsctags.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --always --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p $pkgdir/usr
  npm install --user root -g --prefix="$pkgdir/usr"
  # local _npmdir="${pkgdir}/usr/lib/node_modules/"
  # mkdir -p "${_npmdir}"
  # cd "${_npmdir}"
  # # npm install -g --prefix "$pkgdir/usr" "$srcdir/doctorjs"
  # npm install -g --prefix "${pkgdir}/usr" "${srcdir}/package/"
}
