_pkgname=apple-mac-plymouth
pkgname="${_pkgname}-git"
pkgver=r1.edab46c
pkgrel=1
pkgdesc='Plymouth theme for someone who wants to create a complete apple theme.'
arch=('any')
url="https://github.com/Msouza91/${_pkgname}/"
license=('GPL3.0')
depends=('plymouth')
makedepends=('git')
source=("https://github.com/Msouza91/${_pkgname}/archive/master.tar.gz")
sha256sums=('SKIP')

prepare () {
	mkdir "$_pkgname"
	tar -xvf master.tar.gz
}

package() {
  cd "${_pkgname}-master"

  _themedir="$pkgdir/usr/share/plymouth/themes/apple-mac-plymouth"

  for N in *.png *.svg preview.sh apple-mac-plymouth.plymouth apple-mac-plymouth.script; do
    install -Dm644 $N "${_themedir}/$N"
  done

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
