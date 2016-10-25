# Maintainer: Jordyn Carattini <onlinecloud1@gmail.com>
pkgname="shsession-git"
pkgver=20161025
pkgrel=1
pkgdesc="A lightweight session manager written in bash."
url="https://github.com/jcjordyn130/shsession"
license=('GPL3')
source=("git://github.com/jcjordyn130/shsession.git")
sha512sums=('SKIP')
arch=('any')
depends=('bash' 'coreutils')
makedepends=('git')
optdepends=('pygtk: for the gui session controller'
	    'python: for the gui session controller'
	    'pm-utils: for the default suspend and hibernate commands'
            'systemd: for the default poweroff and reboot commaands')

pkgver() {
  # Update the pkgver to the date makepkg was run
  echo $(date +%Y%m%d)
}

package() {
  # Make the usr and usr/bin directories in the package
  mkdir -p ${pkgdir}/usr/bin
  # Copy shsession into the package
  cp -v ${srcdir}/shsession/shsession ${pkgdir}/usr/bin/shsession
  mkdir -p ${pkgdir}/usr/share/shsession
  cp -rv ${srcdir}/shsession/sessions ${pkgdir}/usr/share/shsession/
  cp -rv ${srcdir}/shsession/sessionctl-gui/* ${pkgdir}/usr/bin/
  cp -rv ${srcdir}/shsession/sessionctl-cli/* ${pkgdir}/usr/bin/
}
