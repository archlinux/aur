# Maintainer: Arschbernd <address at domain dot tld>
pkgname=krautbbs
_pkgname=KrautBBS
pkgver=v0.5.beta.r0.g46e03ca
pkgrel=1
pkgdesc="A command line lurking tool for Krautchan"
arch=('any')
url="https://github.com/n4n0GH/KrautBBS"
license=('GPL')
groups=()
depends=('python2' 'python2-beautifulsoup3' 'python2-requests')
makedepends=('git' 'python2-pip')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$_pkgname::git+https://github.com/n4n0GH/KrautBBS.git"
        "setup.py"
        "krautbbs")
noextract=()
md5sums=('SKIP'
         'SKIP'
         'SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  echo "Nothing to build"
}

package() {
  cd "$srcdir/"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  chmod +x "$pkgdir/usr/bin/krautbbs"
}
