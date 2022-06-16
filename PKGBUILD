# Maintainer: Vojko Pribudić <dmanthing@gmail.com>

pkgname=expressvpn-gui
pkgver=0.6.8
pkgrel=1
pkgdesc='Unofficial linux GUI for expressvpn CLI (Qt)'
arch=('x86_64')
url="https://gitlab.com/vojko.pribudic/${pkgname}"
license=('custom')
depends=(
    bash
    pyside6
    expressvpn
    python-pexpect
)
source=("${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
md5sums=('SKIP')

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  mkdir -p "${pkgdir}/opt/${pkgname}"
  touch "${pkgdir}/opt/${pkgname}/settings.dat"
  chmod 777 "${pkgdir}/opt/${pkgname}/settings.dat"
  cp -r . "${pkgdir}/opt/${pkgname}"
  install -Dm755 "$srcdir/${pkgname}-v${pkgver}/${pkgname}" "$pkgdir/usr/bin/$pkgname"
  desktop-file-install "$srcdir/${pkgname}-v${pkgver}/${pkgname}.desktop" --dir "$pkgdir/usr/share/applications/"
  
}
