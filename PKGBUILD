# Maintainer: basigur

pkgname=mcos-mjv-nordic-theme
pkgver=2.3~r21.04572db
pkgrel=1
pkgdesc="It's GTK2,GTK3,XFCE4 Theme Mac OS Nordic"
arch=('any')
url="https://github.com/basigur/mcos-mjv-nordic-theme"
license=('GPL2')
depends=('gtk-engine-murrine')
makedepends=(git)
source=("$pkgname::git+https://github.com/basigur/$pkgname")

sha512sums=('SKIP')

pkgver() {
  cd "${pkgname}"

  echo "2.3~r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package(){
    cd "${pkgname}"
    install -d "${pkgdir}/usr/share/themes"
    install -d "${pkgdir}/usr/share/doc/$pkgname"

    install -Dm 0644 {README.md,doc/'READ ME',doc/'COPYING'} "${pkgdir}/usr/share/doc/$pkgname"
    install -Dm 0644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
    cp -R {'McOS-MJV-Dark-Nordic','McOS-MJV-Nordic'} "${pkgdir}"/usr/share/themes/
}
