# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

_ver='v2_03'
_rel='22476'
pkgname='arcconf'
pkgver=2.03_22476
pkgrel=1
pkgdesc='Microsemi Adaptec command line interface utility'
arch=('x86_64')
url='https://storage.microsemi.com/en-us/support'
license=('freeware')
source=("http://download.adaptec.com/raid/storage_manager/${pkgname}_${_ver}_${_rel}.zip")
sha256sums=('8350be500ddf18d474c08fde7d1bc0e50dca96edb1e2d210f384ec59b6e33db6')

pkgver() {
  _ver=`echo ${_ver} | sed -e 's:v::' -e 's/_/./g'`
  echo -e "${_ver}_${_rel}"
}

package() {
  cd "${srcdir}/linux_x64/cmdline"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
