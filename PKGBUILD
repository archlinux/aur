# Maintainer: basigur

pkgname=mcos-mjv-nordic-theme
pkgver=2.3~r
pkgrel=1
pkgdesc="It's GTK2,GTK3,XFCE4 Theme Mac OS Nordic"
arch=('any')
url="https://github.com/basigur/mcos-mjv-nordic-theme"
license=('GPL2')
depends=('gtk-engine-murrine')
replaces=(mcos-mjv-nordic-theme)
conflicts=()
makedepends=(git)

source=("$pkgname::git+https://github.com/basigur/$pkgname")

sha512sums=('SKIP')

pkgver() {
  cd "${pkgname}"

  echo "2.3~r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}


package(){
    cd "${srcdir}/${pkgname}"
    install -d "${pkgdir}/usr/share/themes"
    install -d "${pkgdir}/usr/share/doc"
    install -d "${pkgdir}/usr/share/licenses"

    cp "${srcdir}"/"${pkgname}"/doc/{'READ ME','COPYING'} "${pkgdir}"/usr/share/doc/
    cp "${srcdir}"/"${pkgname}"/LICENSE "${pkgdir}"/usr/share/licenses/LICENSE
    cp -r 'McOS-MJV-Dark-Nordic' 'McOS-MJV-Nordic' "${pkgdir}"/usr/share/themes/

}
