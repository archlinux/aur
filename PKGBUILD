# Maintainer: Doug Newgard <scimmia at archlinux dot info>

_pkgname=epymc
pkgname=$_pkgname-git
pkgver=1.0.0.r10.gb582278
pkgrel=1
pkgdesc="Media Center based on EFL - Development version"
arch=('any')
url="https://github.com/DaveMDS/epymc"
license=('GPL3')
depends=('python-efl')
optdepends=('lirc: remote contol support'
            'python-mutagen: Music module'
            'python-beautifulsoup4: Online Channels module'
            'sdlmame: MAME module')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
install=$_pkgname.install
source=("git://github.com/DaveMDS/epymc.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  git describe --tags --long | sed 's/^v//;s/-beta/beta/;s/-/.r/;s/-/./g'
}

package() {
  cd "$srcdir/$_pkgname"

  python setup.py install --root="$pkgdir" --optimize=1
}
