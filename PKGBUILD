# Maintainer: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>

_pkgname=perl-scripts
pkgname=image2png-git
pkgver=22.07.r6.g03816b2
pkgrel=1
pkgdesc="Convert any image (SVG, WEBP, JPEG, and more) to PNG, using the Gtk3::Gdk::Pixbuf library."
arch=('any')
url="https://github.com/trizen/${_pkgname}"
license=('GPL3')
makedepends=('git')

provides=()
conflicts=()

depends=('perl>=5.20.0' 'perl-gtk3' 'webp-pixbuf-loader')

source=("git+https://github.com/trizen/${_pkgname}.git")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$_pkgname"
    install -D -m 755 "Image/image2png.pl" "$pkgdir/usr/bin/image2png.pl"
}
