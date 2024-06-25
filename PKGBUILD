# Maintainer: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>

_pkgname=perl-scripts
pkgname=markdown2pdf-git
pkgver=23.09.r132.g345abfd
pkgrel=1
pkgdesc="Markdown to PDF converter with syntax highlighting, using md2html (md4c), highlight and wkhtmltopdf."
arch=('any')
url="https://github.com/trizen/${_pkgname}"
license=('GPL-3.0-or-later')
makedepends=('git')

provides=("markdown2pdf=${pkgver}")
conflicts=('markdown2pdf')

depends=('perl>=5.10.0' 'perl-html-tree' 'perl-ipc-run3' 'wkhtmltopdf' 'highlight' 'md4c')

optdepends=(
    'wkhtmltopdf-static: to generate PDF outlines'
)

source=("git+https://github.com/trizen/${_pkgname}.git")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$_pkgname"
    install -D -m 755 "Converters/markdown2pdf.pl" "$pkgdir/usr/bin/markdown2pdf.pl"
}
