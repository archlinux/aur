# Maintainer: Denis Kasak <reversed(moc.liamg@kasak.sined)>

pkgname=python-pysocks-git
project_name=pysocks
pkgver=20130319
pkgrel=1
pkgdesc='Routes sockets of any TCP service through a SOCKS4, SOCKS5 or HTTP proxy (Anorov fork of socksipy)'
arch=('any')
license=('BSD')
url='https://github.com/Anorov/PySocks'
depends=('python')
provides=('socksipy')
conflicts=('socksipy')
makedepends=('git')
source=('setup.py'
        "$project_name::git+git://github.com/Anorov/PySocks.git")
md5sums=('46900e68be3f54a3bba2199faba326df'
         'SKIP')

pkgver() {
  cd "$srcdir/$project_name"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

build() {
  cp "$srcdir/setup.py" "$srcdir/$project_name/"
}

package() {
  cd "$srcdir/$project_name"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
