# Maintainer: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>

_pkgname=perl-scripts
pkgname=zip2tar-git
pkgver=23.09.r114.ge687d10
pkgrel=1
pkgdesc="Command-line tool to convert ZIP files to TAR (with optional compression)"
arch=('any')
url="https://github.com/trizen/${_pkgname}"
license=('GPL3')
makedepends=('git')

provides=()
conflicts=()

depends=('perl>=5.36.0' 'perl-archive-zip')
optdepends=('perl-io-compress-lzma: support for XZ compression')

source=("git+https://github.com/trizen/${_pkgname}.git")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$_pkgname"
    install -D -m 755 "Converters/zip2tar.pl" "$pkgdir/usr/bin/zip2tar.pl"
}
