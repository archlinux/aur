# Maintainer: Gabriele Musco <emaildigabry@gmail.com>
# Upstream URL: https://github.com/gabmus/razercommander

pkgname=razercommander-git
pkgver=0.1
pkgrel=1
pkgdesc='A simple GTK control center for managing razer peripherals on Linux. Make sure to install https://github.com/pez2001/razer_chroma_drivers/ first.'
arch=('x86_64')
url='https://github.com/gabmus/razercommander'
license=('GPLv3')
depends=('gtk3>=3.16','gksu','python')
makedepends=('git')
source=("razercommander::git+git://github.com/gabmus/razercommander")
md5sums=('SKIP')

package() {
  cd "$srcdir"
  mkdir -p $pkgdir/usr/share/applications
  mkdir -p $pkgdir/usr/bin
  cp razercommander/razercommander.desktop.in $pkgdir/usr/share/applications/razercommander.desktop
  cp -r razercommander $pkgdir/usr/share/razercommander
  echo -e "#\!/bin/sh\npython3 /usr/share/razercommander/main.py" > $pkgdir/usr/bin/razercommander
  chmod +x $pkgdir/usr/bin/razercommander
}
