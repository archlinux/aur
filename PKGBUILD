# Maintainer: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>

_pkgname=perl-scripts
pkgname=outguess-png-git
pkgver=22.07.r7.gf6bc547
pkgrel=1
pkgdesc="Hide arbitrary data into the pixels of a PNG image (steganographic tool)."
arch=('any')
url="https://github.com/trizen/${_pkgname}"
license=('GPL3')
makedepends=('git')

provides=()
conflicts=()

depends=('perl>=5.20.0' 'perl-gd')

source=("git+https://github.com/trizen/${_pkgname}.git")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$_pkgname"
    install -D -m 755 "Image/outguess-png.pl" "$pkgdir/usr/bin/outguess-png.pl"
}
