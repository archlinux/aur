# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

# otfinfo --info *.ttf

_pkgname='ezhuthu'
pkgname="ttf-${_pkgname}"
pkgver=1.2
pkgrel=2
pkgdesc='Ezhuthu Malayalam handwriting style font'
arch=('any')
url='http://rachana.org.in'
_url_source='https://gitlab.com/rit-fonts/ezhuthu'
license=('OFL')
makedepends=('fontforge' 'git')
source=("${pkgname}::git+${_url_source}.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
  make -C "${pkgname}" ttf
}

package() {
  cd "${pkgname}"
  install -Dvm644 "build/${_pkgname^}-Regular.ttf" -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 "${_pkgname^}-character-set.pdf" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 "in.org.rachana.${_pkgname}.metainfo.xml" -t "${pkgdir}/usr/share/metainfo"
}

# vim: ts=2 sw=2 et:
