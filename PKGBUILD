# Maintainer: Jordyn Carattini <onlinecloud1@gmail.com>
pkgname="shgreeter-git"
pkgver=r11.3859afb
pkgrel=1
pkgdesc="If placed in the proper directory, this script greets the user and offers some potentially interesting information about the system's current resources."
url="https://github.com/jcjordyn130/shgreeter"
license=('GPL3')
source=("git://github.com/jcjordyn130/shgreeter.git")
sha512sums=('SKIP')
arch=('any')
depends=('bash' 'coreutils')
makedepends=('git')
optdepends=('lsb-release: for outputing the name of the distro')

pkgver() {
  # Update the pkgver from the git revision
  cd ${srcdir}/shgreeter
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  # Make the usr and usr/bin directories in the package
  mkdir -p ${pkgdir}/usr/bin
  # Copy shgreeter into the package
  cp -v ${srcdir}/shgreeter/shgreeter ${pkgdir}/usr/bin/shgreeter
}
