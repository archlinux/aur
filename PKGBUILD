# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

pkgname=sidef
pkgver=0.09
pkgrel=1
pkgdesc="A modern object-oriented programming language."
url="https://github.com/trizen/${pkgname}"
arch=('any')
license=('GPLv3')
depends=('perl>=5.14.2' 'perl-data-dump')
makedepends=('perl-module-build')

source="https://github.com/trizen/${pkgname}/archive/${pkgver}.tar.gz"
sha256sums=('ed44b8cc17bc2fc0413864f358c290e46902ae9535ee72f48b8328bf776eb378')

package() {
    cd "$pkgname-$pkgver"
    perl Build.PL --destdir "$pkgdir" --installdirs vendor
    ./Build
    ./Build test
    ./Build install --install_path script=/usr/bin
}
