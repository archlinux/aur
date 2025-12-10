# Maintainer: Tomasz Pakuła <forest10pl (at) gmail.com>
_reponame=cec-toolbox
pkgname=$_reponame-git
provides=($_reponame)
pkgver=0.0.1
pkgrel=1
pkgdesc="Adjust your Moza Racing gear settings"
arch=('x86_64')
url="https://github.com/Lawstorant/$_reponame"
license=('GPL3')
depends=(
	v4l-utils
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
#install=services.install

pkgver() {
  cd "$srcdir/$_reponame"
  git describe --long --tags | cut -c2- | sed 's/-/.r/' | sed 's/-/./'
}

package() {
  cd "$srcdir/$_reponame" || exit 1
  PREFIX="$pkgdir" make install
}

