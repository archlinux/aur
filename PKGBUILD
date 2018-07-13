# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

_ver='v2_06'
_rel='23167'
pkgname='arcconf'
pkgver=2.06_23167
pkgrel=1
pkgdesc='Microsemi Adaptec command line interface utility'
arch=('x86_64')
url='https://storage.microsemi.com/en-us/support'
license=('freeware')
source=("http://download.adaptec.com/raid/storage_manager/${pkgname}_${_ver}_${_rel}.zip")
sha256sums=('533e8ecfe34de28b146a76faefe7e6b2dcfa6ccb72045ef87ebfac254d56d5f7')

pkgver() {
  _ver=`echo ${_ver} | sed -e 's:v::' -e 's/_/./g'`
  echo -e "${_ver}_${_rel}"
}

package() {
  cd "${srcdir}/linux_x64/cmdline"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
