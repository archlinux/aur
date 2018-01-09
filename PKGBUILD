# Maintainer: Noeljnuior <liamgliamgmailcom>

pkgname=pscripts-git
pkgver=0.1a
pkgrel=1
pkgdesc="Noeljunior's pscripts: some handy scripts for users and sysadmins"
arch=('any')
url="https://github.com/Noeljunior/pscripts"
license=('GPL')
depends=(git)
source=("$pkgname::git+https://github.com/Noeljunior/pscripts")
md5sums=('SKIP')

package() {
	cd $srcdir/$pkgname

    ./sysadmin/pscripts --install "/opt/pscripts" --profile "/etc/profile.d/pscripts.sh"
}

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
