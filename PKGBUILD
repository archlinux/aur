# Maintainer: Henry Malinowski <malinowski.henry at gmail dot com>
_pkgname=swatchtime
pkgname=swatchtime-git
_reponame="SwatchTime"
pkgver=v0.9.r0.g610666c
pkgrel=1
pkgdesc="displays Swatch Internet Time in a formatted manner"
arch=('any')
url="https://github.com/henry-malinowski/SwatchTime"
license=('MIT')
depends=('python')
source=("git://github.com/henry-malinowski/SwatchTime.git")
sha256sums=('SKIP')

pkgver()
{
    cd "$srcdir/$_reponame"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package()
{
  cd "$srcdir/$_reponame" 
  install -D --mode=0644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D --mode=0755 "swatchtime.py" "${pkgdir}/usr/bin/${_pkgname}"
  install -D --mode=0644 "swatchtime.1" --target-directory="${pkgdir}/usr/share/man/man1"
}

