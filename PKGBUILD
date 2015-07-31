# Maintainer: aksr <aksr at t-com dot me>
pkgname=swm-git
pkgver=1.0.r9.g151f81e
pkgrel=1
epoch=
pkgdesc="Simple window manager."
arch=('i686' 'x86_64')
url="https://github.com/dcat/swm"
license=('MIT')
groups=()
depends=('')
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=('swm')
replaces=()
backup=()
options=()
changelog=
install=${pkgname}.install
source=("$pkgname::git+https://github.com/dcat/swm"
        'config.h')
noextract=()
md5sums=('SKIP'
         '1f592cc09921d28966aaca86b710465a')
sha1sums=('SKIP'
          'facc115b6f93d5e6356550235c3f5bffcb8d79ad')
sha256sums=('SKIP'
            '9f007a5a93c0a95c3cea521782f73f1438524b51cf3d27fb5a7482ba3e5ad9c4')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//g'
}

prepare() {
  cd "$srcdir/$pkgname"
  cp ../config.h config.h
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}

