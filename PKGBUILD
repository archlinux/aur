# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: tardo ... nagi-fanboi*net

set -u
pkgname='recoverdm'
pkgver='0.20'; _commit='8ecb7438b6902c040db05313bea57eb093838143'
pkgrel='4'
pkgdesc='recover damaged CD DVD and disks with bad sectors'
arch=('x86_64')
url='http://www.vanheusden.com/recoverdm/'
license=('GPL')
depends=('glibc')
_giturl='https://github.com/flok99/recoverdm'
#_srcdir="${pkgname}-${pkgver}"
_srcdir="${pkgname}-${_commit}"
source=(
  #"https://www.vanheusden.com/recoverdm/${pkgname}-${pkgver}.tgz"
  "${pkgname}-${pkgver}-github.tgz::${_giturl}/archive/${_commit}.tar.gz"
)
md5sums=('ee948c9ee2436fb5bc3ecfe0f0509d89')
sha256sums=('1e34231e79337058a15db563aa9551c4366ee4652879e587edec059e28e55438')

build() {
  set -u
  cd "${_srcdir}"
  make
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  install -Dpm0755 'mergebad' 'recoverdm' -t "${pkgdir}/usr/bin/"
  set +u
}
set +u
