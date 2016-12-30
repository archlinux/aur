# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=perl-build
pkgver=1.13
pkgrel=1
pkgdesc="Compile and install perl"
arch=('any')
url="https://github.com/tokuhirom/Perl-Build"
license=('GPL')
depends=('plenv')
source=("https://github.com/tokuhirom/Perl-Build/archive/$pkgver.zip")
md5sums=('02cb9bc4f62f39ad075a2776a7e2026f')

package() {
    mkdir -p "${pkgdir?}"{/opt/plenv/plugins/perl-build/bin,/usr/bin}
    cd "${srcdir?}/Perl-Build-$pkgver" || return

    for bin in plenv-{,un}install perl-build; do
        cp -- "bin/$bin" "$pkgdir/opt/plenv/plugins/perl-build/bin/$bin"
        ln -s /opt/plenv/plugins/perl-build/bin/"$bin" "$pkgdir/usr/bin/$bin"
    done
}
