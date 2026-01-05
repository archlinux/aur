# Maintainer: Eisuke Kawashima <e DOT kawaschima+arch AT gmail DOT com>
# Contributor: Eric Berquist <eric DOT berquist AT gmail DOT com>

pkgname=nwchem-data
_pkgver=7.3.1-1
pkgver="${_pkgver//-/\.}"
pkgrel=1
pkgdesc='High-performance computational chemistry software (data files)'
arch=('any')
url='https://nwchemgit.github.io'
license=('custom:ECL2.0' 'GPL3')
options=('!debug' '!strip')
source=("http://httpredir.debian.org/debian/pool/main/n/nwchem/${pkgname}_${_pkgver}_all.deb")
sha256sums=('a52a7c2faf019043417ffd85d25b56d19fb8df60f0db39c5a9baeae46802c58e')

package() {
  local -a tar_exclude=(--exclude '*Debian*' --exclude lintian) # exclude debian-specific files
  bsdtar -C "${pkgdir}/" "${tar_exclude[@]}" -xvf data.tar.xz

  install -Dm644 "${pkgdir}"/usr/share/doc/"${pkgname}"/copyright "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
