# Maintainer: adelin-b
pkgname=('yawhich-key-git')
pkgrel=1
pkgver=0.8.0.r1.g03b4803
pkgdesc="Yet another which-key but universal for all applications, desktop environment"
arch=('any')
url="https://github.com/adelin-b/yawhich-key"
license=('GPL3')
# groups=()
depends=('rofi'
    'yq2-bin')
makedepends=('git')
# optdepends=()
# replaces=()
provides=("yawhich-key")
conflicts=("yawhich-key")
# backup=()
# options=()
# install=
# changelog=$pkgname
source=("$pkgname::git+https://github.com/adelin-b/yawhich-key.git")

# noextract=()
md5sums=('SKIP')

package() {
  cd "$srcdir/$pkgname"
  echo $pkgdir
     make DESTDIR="$pkgdir/" install
  # install -Dm744 "${srcdir}/yawhich-key" "${pkgdir}/urs/local/bin/yawhich-key}"

}

pkgver() {
  cd "$srcdir/$pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
