# Maintainer: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>

_pkgname=perl-scripts
pkgname=outguess-png-git
pkgver=23.09.r133.g50403e9
pkgrel=1
pkgdesc="Hide arbitrary data into the pixels of a PNG image (steganographic tool)."
arch=('any')
url="https://github.com/trizen/${_pkgname}"
license=('GPL-3.0-or-later')
makedepends=('git')

provides=("outguess-png=$pkgver")
conflicts=("outguess-png")

depends=('perl>=5.20.0' 'perl-imager')

source=("git+https://github.com/trizen/${_pkgname}.git")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$_pkgname"
    install -D -m 755 "Image/outguess-png-imager.pl" "$pkgdir/usr/bin/outguess-png.pl"
}
