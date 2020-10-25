# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

# otfinfo --info *.otf

_name='OpenDyslexic'
_pkgname="otf-${_name,,}"
pkgname="${_pkgname}-git"
pkgver=0.91.12.r27.g2cafdbc
pkgrel=1
pkgdesc='Typeface that uses typeface shapes & features to help offset some visual symptoms of Dyslexia'
arch=('any')
url='https://opendyslexic.org'
_url_source='https://github.com/antijingoist/opendyslexic'
license=('OFL')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${_url_source}.git")
sha256sums=('SKIP')

pkgver() {
  git -C "${_name,,}" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${_name,,}"
  install -Dvm644 "compiled/${_name}-"*.otf -t "${pkgdir}/usr/share/fonts/OTF"
  install -Dvm644 "compiled/${_name,,}-characters.pdf" -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dvm644 'OFL.txt' "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
