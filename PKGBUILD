# Maintainer: ustcpetergu <ustcymgu@gmail.com>
pkgname=silitune
pkgver=r36.3325994
pkgrel=1
pkgdesc="A battery saver, undervolting tuner and CPU manager with GUI"
arch=('x86_64')
url='https://github.com/ustcpetergu/silitune'
license=('GPL')
groups=()
depends=('intel-undervolt' 'tlp' 'python-pyqt5' 'python-matplotlib' 'gksu')
makedepends=('git')
optdepends=('p7zip: benchmark support')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(silitune::git+https://github.com/ustcpetergu/SiliTune)
noextract=()
md5sums=('SKIP') #autofill using updpkgsums

pkgver() {
    cd "$srcdir/${pkgname}"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    true
}

check() {
    true
}

package() {
  cd "$srcdir/${pkgname}"

  install -D ./silitune.conf "$pkgdir/etc/silitune.conf"
  install -D -m755 ./silitune.py "$pkgdir/usr/bin/silitune"
  install -d "$pkgdir/usr/share/applications" "$pkgdir/usr/lib/silitune" "$pkgdir/var/lib/silitune"
  install -D ./silitune.desktop "$pkgdir/usr/share/applications/SiliTune.desktop"
  install -D ./icon.png ./logo.png ./sililib.py ./plotter.py "$pkgdir/usr/lib/silitune/"
}
