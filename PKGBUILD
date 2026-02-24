# Maintainer: Tomasz Pakuła <forest10pl (at) gmail.com>
_reponame=p14s-wifi-reset
pkgname=$_reponame-git
provides=($_reponame)
pkgver=0.0.1
pkgrel=2
pkgdesc="Wi-Fi adapter reset script for Thinkpad T14/P14s Gen4"
arch=('x86_64')
url="https://github.com/Lawstorant/$_reponame"
license=('GPL3')
depends=(
	bash
)
makedepends=(
  git
)
source=(
  git+https://github.com/Lawstorant/$_reponame
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "$srcdir/$_reponame"
  git describe --long --tags | cut -c2- | sed 's/-/.r/' | sed 's/-/./'
}

package() {
  cd "$srcdir/$_reponame" || exit 1
  PREFIX="$pkgdir" make install
}

