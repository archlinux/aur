# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

pkgname=sidef
pkgver=0.10
pkgrel=1
pkgdesc="A modern object-oriented programming language."
url="https://github.com/trizen/${pkgname}"
arch=('any')
license=('GPLv3')
depends=('perl>=5.14.2' 'perl-data-dump')
makedepends=('perl-module-build')

source="https://github.com/trizen/${pkgname}/archive/${pkgver}.tar.gz"
sha256sums=('c952cf2967f8a01362c829037bf1f63c79c9cbff7a18c78c4b27b1fcffa94264')

package() {
    cd "$pkgname-$pkgver"
    perl Build.PL --destdir "$pkgdir" --installdirs vendor
    ./Build
    ./Build test
    ./Build install --install_path script=/usr/bin
}
