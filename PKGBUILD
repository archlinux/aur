# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

pkgname=sidef
pkgver=0.08
pkgrel=1
pkgdesc="A modern object-oriented programming language."
url="https://github.com/trizen/${pkgname}"
arch=('any')
license=('GPLv3')
depends=('perl>=5.14.2' 'perl-data-dump')
makedepends=('perl-module-build')

source="https://github.com/trizen/${pkgname}/archive/${pkgver}.tar.gz"
sha256sums=('bab31bcb418307d7263a0e47a1d78d0be73b133b6b1510154e7e475fde046bc0')

package() {
    cd "$pkgname-$pkgver"
    perl Build.PL --destdir "$pkgdir" --installdirs vendor
    ./Build
    ./Build test
    ./Build install --install_path script=/usr/bin
}
