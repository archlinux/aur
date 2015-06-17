# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

pkgname=sidef
pkgver=0.05
pkgrel=1
pkgdesc="A modern object-oriented programming language."
url="https://github.com/trizen/${pkgname}"
arch=('any')
license=('GPLv3')
depends=('perl>=5.14.2' 'perl-data-dump')

source="https://github.com/trizen/${pkgname}/archive/${pkgver}.tar.gz"
sha256sums=('ad8811dc7f6e79f7485a8e9f9df33ad68e24f01d0c550885942b342e6212e919')

package() {
    cd "$pkgname-$pkgver"
    perl Build.PL --destdir "$pkgdir" --installdirs vendor
    ./Build
    ./Build test
    ./Build install --install_path script=/usr/bin
}
