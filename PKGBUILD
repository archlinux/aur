# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

# otfinfo --info *.ttf

_pkgname='ezhuthu'
pkgname="ttf-${_pkgname}"

pkgver=1.2
pkgrel=1
_commit_version='1b01e921a6cce3b5d99bdcd07223f407108b0a8a'

pkgdesc='Ezhuthu Malayalam handwriting style font'
arch=('any')
url='http://rachana.org.in'
_url_source='https://gitlab.com/rit-fonts/ezhuthu'
license=('OFL')
makedepends=('fontforge' 'git')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("git+${_url_source}.git#commit=${_commit_version}")
sha256sums=('SKIP')

build() {
  make -C "${_pkgname}" ttf
}

package() {
  cd "${_pkgname}"
  install -Dvm644 "build/${_pkgname^}-Regular.ttf" -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 "${_pkgname^}-character-set.pdf" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 "in.org.rachana.${_pkgname}.metainfo.xml" -t "${pkgdir}/usr/share/metainfo"
}

# vim: ts=2 sw=2 et:
