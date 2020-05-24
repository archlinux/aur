# Maintainer: Victor Perevozchikov webmaster@victor3d.com.br
pkgname=audio-m4p
pkgver=1
pkgrel=1
pkgdesc='Read-only release history for Audio-M4P'
arch=('any')
url="https://github.com/gitpan/Audio-M4P"
license=('GPL-2.0')
depends=('perl')
makedepends=('git')
source=('git+https://github.com/gitpan/Audio-M4P')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/Audio-M4P"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/Audio-M4P"
perl Makefile.PL
make
make test
make install
}
