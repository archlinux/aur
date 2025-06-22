# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: Jeremy Ruten <jeremy.ruten@gmail.com>
# Contributor: Brad Conte <brad@bradconte.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=stopwatch
pkgver=3.5
pkgrel=9
pkgdesc="Timing app written in Tcl/Tk"
arch=('any')
url="https://wiki.tcl-lang.org/page/${pkgname}"
license=('LicenseRef-stopwatch')
depends=('tk')
source=("${pkgname}-${pkgver}.tar.gz::http://deb.debian.org/debian/pool/main/s/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz"
        LICENSE)
sha512sums=('f22cbd8e16d7d24c4b32191c5eb413e65d49207aaf6917eb3748e7aa55091b2f7ff8b03ab7954e1ee96a775c72443e6dfd5834311e5933a303f4e16b4c299ef2'
            'b0ca44c7e860f3cf79034d47185b305f3afc63d0d047c1c62d5a75f04941ff953538c6a4063a2c365b945910cf35519dcfb11ffd76ab7ef15d26dc30baf42e05')

prepare() {
  mv "${srcdir}/${pkgname}-3.4" "${srcdir}/${pkgname}-${pkgver}"
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i 's|/depot/path/wish|/usr/bin/wish|g' "${pkgname}"
}

package() {
  cd "${pkgname}-${pkgver}"
  install -vDm0755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm0644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -vDm0644 HISTORY "${pkgdir}/usr/share/doc/${pkgname}/HISTORY"
  install -vDm0644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}
