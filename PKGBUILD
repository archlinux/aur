# Maintainer: twa022 <twa022 at gmail dot com>

_pkgnamefmt=LibreOffice
_pkgname=libreoffice
pkgname=${_pkgname}-dev-bin
_LOver=6.2.0.2
pkgver=6.2.0.2
_basever=$( cut -f1-2 -d'.' <<< ${_LOver} )
pkgrel=1
arch=('i686' 'x86_64')
license=('LGPL3')
url="https://www.libreoffice.org/"
pkgdesc="LibreOffice development branch"
depends=('gtk2' 'lpsolve' 'liborcus' 'neon' 'curl')
optdepends=('java-runtime:          adds java support'
            'java-environment:      required by extension-wiki-publisher and extension-nlpsolver'
            'coin-or-mp:            required by the Calc solver'
            'gtk3:                  for GTK3 integration'
            'kio:                   for Qt5 integration')
provides=('libreoffice' 'libreoffice-en-US')

source_i686=("https://dev-builds.libreoffice.org/pre-releases/rpm/x86/${_pkgnamefmt}_${_LOver}_Linux_x86_rpm.tar.gz")
source_x86_64=("https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/${_pkgnamefmt}_${_LOver}_Linux_x86-64_rpm.tar.gz")
sha256sums_i686=('SKIP')
sha256sums_x86_64=('SKIP')

package() {
	find "${srcdir}/${_pkgnamefmt}_${_LOver}"*/RPMS/*rpm -exec bsdtar -x -f '{}' -C "${pkgdir}" \;
}
