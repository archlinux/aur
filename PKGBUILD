# Maintainer: Nemo <aur@captnemo.in>

# otfinfo --info *.ttf

_pkgname='ezhuthu'
pkgname="ttf-${_pkgname}"
pkgver=1.5.2
pkgrel=1
pkgdesc='Malayalam handwriting style font'
arch=('any')
url='http://rachana.org.in'
_url_source='https://gitlab.com/rit-fonts/ezhuthu'
license=('OFL-1.1')
makedepends=('unzip')
source=("${pkgname}::${_url_source}/-/jobs/artifacts/${pkgver}/download?job=build-tag")
sha256sums=('e4b6d7bd0f427ee32be11844a1cd5e17d583724e99075f4861a15036a62f4b6d')

package() {
  cd fonts
  install -Dm644 "ttf/RIT-${_pkgname^}-Regular.ttf" -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 "${_pkgname^}-character-set.pdf" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 "in.org.rachana.${_pkgname}.metainfo.xml" -t "${pkgdir}/usr/share/metainfo"
  install -Dm644 "LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
