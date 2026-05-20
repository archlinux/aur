# Maintainer: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>

_pkgname=perl-scripts
pkgname=sponsor-free-git
pkgver=24.11.r109.g21b70e0
pkgrel=1
pkgdesc="SponsorBlock CLI for YouTube Videos: marks or removes sponsored segments using FFmpeg."
arch=('any')
url="https://github.com/trizen/${_pkgname}"
license=('GPL-3.0-or-later')
makedepends=('git')

provides=("sponsor-free=${pkgver}")
conflicts=('sponsor-free')

depends=('perl>=5.36.0' 'ffmpeg' 'perl-uri' 'perl-io-socket-ssl' 'perl-image-exiftool')
optdepends=()

source=("git+https://github.com/trizen/${_pkgname}.git")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$_pkgname"
    install -D -m 755 "Video/sponsor-free.pl" "$pkgdir/usr/bin/sponsor-free"
}
