# Maintainer: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>

_pkgname=perl-scripts
pkgname=html2text-git
pkgver=22.07.r4.g34f39e2
pkgrel=1
pkgdesc="HTML to text (UTF-8) converter, given either an HTML file, or an URL."
arch=('any')
url="https://github.com/trizen/${_pkgname}"
license=('GPL3')
makedepends=('git')

provides=()
conflicts=()

depends=('perl>=5.10.0' 'perl-html-tree' 'perl-html-formatter')

optdepends=(
    'perl-libwww: support for URLs'
    'perl-lwp-protocol-https: support for HTTPS URLs'
)

source=("git+https://github.com/trizen/${_pkgname}.git")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$_pkgname"
    install -D -m 755 "Converters/html2text.pl" "$pkgdir/usr/bin/html2text.pl"
}
