# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=perl-build
pkgver=1.31
pkgrel=1
pkgdesc="Compile and install perl"
arch=('any')
url="https://github.com/tokuhirom/Perl-Build"
license=('GPL')
depends=('plenv')
source=("https://github.com/tokuhirom/Perl-Build/archive/$pkgver.zip")
md5sums=('78d87b9cdd119b5a96437f19806da7a9')

package() {
    mkdir -p "${pkgdir?}"{/opt/plenv/plugins/perl-build/bin,/usr/bin}
    cd "${srcdir?}/Perl-Build-$pkgver" || return

    for bin in plenv-{,un}install perl-build; do
        cp -- "bin/$bin" "$pkgdir/opt/plenv/plugins/perl-build/bin/$bin"
        ln -s /opt/plenv/plugins/perl-build/bin/"$bin" "$pkgdir/usr/bin/$bin"
    done
}
