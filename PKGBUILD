# Maintainer: aksr <aksr at t-com dot me>
pkgname=pop3-git
pkgver=0.r32.61bc327
pkgrel=1
epoch=
pkgdesc="A simple pop3 mail client."
arch=('i686' 'x86_64')
url="http://litcave.rudi.ir/"
url="http://repo.or.cz/w/pop3.git"
license=('custom:BSD')
groups=()
depends=('polarssl')
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=('pop3')
replaces=()
backup=()
options=()
changelog=
install=pop3-git.install
source=("$pkgname::git://repo.or.cz/pop3.git"
        'config.h')
noextract=()
md5sums=('SKIP'
         '92dcce375bc474ac93c8b9e52cfdb9c3')
sha1sums=('SKIP'
          '3fb16f03964e74bd9717fea40bdd1ae0306d4686')
sha256sums=('SKIP'
            '05c24acf7107f8bcbb95bf5dfe86523977df744afa1a9f4c71fff8fac1535310')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $srcdir
  cp config.h $pkgname/config.h
}

build() {
  cd "$srcdir/$pkgname"
  make all
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 pop3 $pkgdir/usr/bin/pop3
}

