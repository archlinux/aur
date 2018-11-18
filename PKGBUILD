# Maintainer: Matthew Ralston <mrals89@gmail.com>
pkgname="curam-git"
pkgver=0.0.1
pkgrel=1
pkgdesc="Provides maintenace functions for Arch Linux."
arch=('any')
url="https://github.com/MatthewRalston/curam"
license=('GPL')
groups=()
depends=('perl' 'package-query' 'rsync' 'aws-cli')
makedepends=('git')
optdepends=()
provides=('curam-git')
backup=('etc/curam/curam.conf' 'etc/curam/home_excludes.conf' 'etc/curam/media_excludes.conf' 'etc/curam/os_excludes.conf' 'etc/curam/symlinks_check.conf')
options=()
source=("https://github.com/MatthewRalston/curam/archive/v0.0.1.tar.gz")
#autofill using updpkgsums

build() {
  cd "$srcdir/curam-${pkgver}/src"
  make PREFIX=/usr docs
}

package() {
  cd "$srcdir/curam-${pkgver}/src"

  make DESTDIR="$pkgdir/" install
}
md5sums=('4f08e6cd834518b4c7a5fa6aa21a0c5a')
