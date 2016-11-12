# Original author: Josiah Schwab <jschwab at gmail dot com>
# Maintainer: Josiah Schwab <jschwab at gmail dot com>

pkgname=texlive-aastex6
pkgdesc="Package for preparing papers in American Astronomical Society (AAS) journals "
pkgver=6.1
pkgrel=1
arch=('i686' 'x86_64')
url="http://journals.aas.org/authors/aastex.html"
depends=('texlive-core')
provides=('texlive-aastex6')
install=texlive-aastex6.install
source=('http://journals.aas.org/authors/aastex/aastex61.cls'
        'http://journals.aas.org/authors/aastex/aasjournal.bst'
        '0001-Apply-temporary-Linux-work-around-for-V6.1.patch')
sha1sums=('94971eeff1130bb9a5632e985d0ba514fe5cb9ed'
          '693276c5dd1ac4111a696088aea4a79534c77620'
          '23d0182902fdb062ff14fb3b87ee4a8665bb4975')


prepare() {

  # apply suggested Linux workaround
  patch -Np1 --follow-symlinks -i "$srcdir/0001-Apply-temporary-Linux-work-around-for-V6.1.patch"

}


package() {

  cd "$srcdir"

  # install current files
  install -Dm644 aastex61.cls $pkgdir/usr/share/texmf-dist/tex/latex/aastex6/aastex61.cls
  install -Dm644 aasjournal.bst $pkgdir/usr/share/texmf-dist/bibtex/bst/aastex6/aasjournal.bst

}
