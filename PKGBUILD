# Maintainer: twa022 <twa022 at gmail dot com>

_pkgnamefmt=LibreOfficeDev
_pkgname=libreoffice
pkgname=${_pkgname}-dev-bin
_LOver=6.4.0.0.beta1
pkgver=6.4.0.0beta1
#_basever=$( cut -f1-2 -d'.' <<< ${_LOver} )
pkgrel=1
arch=('x86_64')
license=('LGPL3')
url="https://www.libreoffice.org/"
pkgdesc="LibreOffice development branch"
depends=('gtk3' 'lpsolve' 'neon' 'curl')
optdepends=('java-runtime:          adds java support'
            'java-environment:      required by extension-wiki-publisher and extension-nlpsolver'
            'coin-or-mp:            required by the Calc solver'
            'kio:                   for Qt5 integration')
provides=('libreoffice' 'libreoffice-en-US')

source=("https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/${_pkgnamefmt}_${_LOver}_Linux_x86-64_rpm.tar.gz")
sha256sums=('991579b5cdcac9c9a34452747a451ffbad1812f2f96ff3c4cbf3da72affac41b')

package() {
	find "${srcdir}/${_pkgnamefmt}_${_LOver}"*/RPMS/*rpm -exec bsdtar -x -f '{}' -C "${pkgdir}" \;
}
