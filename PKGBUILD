# Maintainer: Michael Polidori <michaelapolidori at gmail dot com>
# Author: Carl Bordum Hansen <carl at bordum dot dk>

pkgname=manly-git
_name=manly
pkgver=0.4.0.r12.b9ade3a
pkgrel=1
pkgdesc="A compliment to the man pages."
url="https://github.com/mpolidori/manly"
depends=('python')
license=('MIT')
arch=('any')
provides=("$_name")
conflicts=("$_name")
source=('git+https://github.com/mpolidori/manly.git')
md5sums=(SKIP)

pkgver() {
  cd "$_name"
  printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
  cd "$srcdir/$_name"
  mv manly.py $_name
  install -Dm 0755 -t ${pkgdir}/usr/bin $_name
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$_name/LICENSE"
}
