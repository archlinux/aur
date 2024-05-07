# Maintainer: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>

_pkgname=perl-scripts
pkgname=markdown2text-git
pkgver=23.09.r111.g2ef6f23
pkgrel=1
pkgdesc="Command-line tool to convert Markdown to plain text (UTF-8)"
arch=('any')
url="https://github.com/trizen/${_pkgname}"
license=('GPL3')
makedepends=('git')

provides=()
conflicts=()

depends=('perl>=5.20.0' 'perl-html-tree' 'perl-html-formatter' 'md4c')

source=("git+https://github.com/trizen/${_pkgname}.git")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$_pkgname"
    install -D -m 755 "Converters/markdown2text.pl" "$pkgdir/usr/bin/markdown2text.pl"
}
