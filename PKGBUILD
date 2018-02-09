# Maintainer bonanza <illogical@protonmail.com>

pkgname=latex-includetikz-git
pkgname_=latex-includetikz
pkgver=0.2.1
pkgrel=1
pkgdesc='Latex package to include external tikz figures and similarly to \includegraphics command.'
arch=(any)
url=https://github.com/gdolle/latex-includetikz
license=(GPL)
install=includetikz.install
depends=(tetex)
conflicts=()
source=('latex-includetikz::git+https://github.com/gdolle/latex-includetikz.git')
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname_"
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$pkgname_"
    dest=${pkgdir}/usr/share/texmf-dist/tex/$pkgname_
	install -d $dest

	cp -r *.sty $dest
}
