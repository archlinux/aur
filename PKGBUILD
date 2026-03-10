# Maintainer  : Chris Billington <chrisjbillington@gmail.com>
# Contributor  : George Eleftheriou <eleftg>
# Contributor : Martin Wimpress <code@flexion.org>
# Contributor : Nick Pope
# Contributor : Bryce Nordgren <bnordgren at gmail dot com>
pkgname=hdfview-bin
_pkgname=HDFView
pkgver=3.4.1
pkgrel=2
pkgdesc="a GUI browser for reading hdf5 files - prebuilt binaries from the HDF group"
arch=('x86_64')
url="https://github.com/HDFGroup/hdfview/"
license=('custom')
provides=('hdfview')
replaces=('hdfview-beta')
conflicts=('hdfview-beta' 'hdfview')
source=("https://github.com/HDFGroup/hdfview/releases/download/v${pkgver}/${_pkgname}-${pkgver}-Linux.deb")
sha512sums=('f36e15e3cd709a9b090b0f27f974e67859943fa9fa35b9f91dff6d85493557448bbd20cb994ac9b65e30b9806df742574c89f14216cdf8dafccfc12de4c8100f')

package() {
  bsdtar -xf "${srcdir}/data.tar.zst" -C ${pkgdir}

  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/hdfview/bin/HDFView" "${pkgdir}/usr/bin/hdfview"

  mkdir -p "${pkgdir}/usr/share/applications"
  ln -s "/opt/hdfview/lib/hdfview-HDFView.desktop" "${pkgdir}/usr/share/applications/"
  
  mkdir -p "${pkgdir}/usr/share/mime/application"
  ln -s "/opt/hdfview/lib/hdfview-HDFView-MimeInfo.xml" "${pkgdir}/usr/share/mime/application/"
}
