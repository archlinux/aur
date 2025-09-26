# Maintainer: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>

_pkgname=perl-scripts
pkgname=resize-images-git
pkgver=24.11.r26.g2f72cba
pkgrel=1
pkgdesc="Command-line batch-processing tool for easily scaling down images."
arch=('any')
url="https://github.com/trizen/${_pkgname}"
license=('GPL-3.0-or-later')
makedepends=('git')

provides=("resize-images=${pkgver}")
conflicts=('resize-images')

depends=('perl>=5.36.0' 'perl-imager' 'perl-image-exiftool')
optdepends=()

source=("git+https://github.com/trizen/${_pkgname}.git")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$_pkgname"
    install -D -m 755 "Image/resize_images.pl" "$pkgdir/usr/bin/resize-images.pl"
}
