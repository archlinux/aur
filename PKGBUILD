# Maintainer: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>

_pkgname=perl-scripts
pkgname=recompress-images-git
pkgver=23.09.r116.g16b9a1a
pkgrel=1
pkgdesc="Command-line tool to recompress PNG and JPEG images for smaller size (lossy compression)"
arch=('any')
url="https://github.com/trizen/${_pkgname}"
license=('GPL3')
makedepends=('git')

provides=()
conflicts=()

depends=('perl>=5.36.0' 'perl-gd' 'perl-file-mimeinfo' 'jpegoptim' 'pngquant')
optdepends=('perl-image-exiftool: alternative to perl-file-mimeinfo (with --exiftool)')

source=("git+https://github.com/trizen/${_pkgname}.git")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$_pkgname"
    install -D -m 755 "Image/recompress_images.pl" "$pkgdir/usr/bin/recompress-images.pl"
}
