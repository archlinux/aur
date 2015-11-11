# Maintainer: Peter Hoeg <firstname at lastname dot com>

_pkgsubver=RC1
pkgname=nemid
pkgver=1.3.1
pkgrel=1
pkgdesc='NemID Certificate Tool'
arch=('i686' 'x86_64')
url='https://www.nemid.nu'
license=('unknown')
depends=('qt4')
source_i686=("${url}/dk-da/support/brug_nemid/send_og_modtag_sikker_e-mail/installation_paa_linux/csp_for_ubuntu/DanID-Multifunktionsloesning-${pkgver}-${_pkgsubver}-Linux32-PRODUCTION-TEST-CODE-DISABLED.tar.gz")
source_x86_64=("${url}/dk-da/support/brug_nemid/send_og_modtag_sikker_e-mail/installation_paa_linux/csp_for_ubuntu/DanID-Multifunktionsloesning-${pkgver}-${_pkgsubver}-Linux64-PRODUCTION-TEST-CODE-DISABLED.tar.gz")
md5sums_i686=('916eb48b961909df418820fcc95c0b4b')
md5sums_x86_64=('b073cb17f62c63d4e1b3f35b7ef52380')

package() {
  cd "${srcdir}"

  mkdir -p $pkgdir/usr/bin/
  mkdir -p $pkgdir/usr/lib/pkcs11

  install -m755 "NemID Konfigurationsprogram/NemID_Konfigurationsprogram" $pkgdir/usr/bin/NemID_Konfigurationsprogram
  install -m755 PKCS11/NemIdPerformRsa $pkgdir/usr/bin/NemIdPerformRsa
  install -m755 PKCS11/libNemID_PKCS11.so.${pkgver} $pkgdir/usr/lib/pkcs11/libNemID_PKCS11.so.${pkgver}
}

# vim:set ts=2 sw=2 et:
