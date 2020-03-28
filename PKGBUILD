# Maintainer: Noeljnuior <liamgliamgmailcom>

pkgname=pscripts-git
pkgver=r101.931081d
pkgrel=1
pkgdesc="Noeljunior's pscripts: some handy scripts for users and sysadmins"
arch=('any')
url="https://github.com/Noeljunior/pscripts"
license=('GPL3')
makedepends=('git' 'python')
source=("$pkgname::git+https://github.com/Noeljunior/pscripts")
md5sums=('SKIP')

package() {
	cd $srcdir/$pkgname

    ./sysadmin/pscripts --install "${pkgdir}/opt/pscripts" --profile "${pkgdir}/etc/profile.d/pscripts.sh" --rm-prefix "${pkgdir}"
}

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
