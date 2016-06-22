# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

_adaptec_ver='v2_01'
_adaptec_rel='22270'
pkgname='arcconf'
pkgver=2.01_22270
pkgrel=1
pkgdesc='Adaptec command line interface utility'
arch=('i686' 'x86_64')
url='http://adaptec.com'
license=('freeware')
source=("http://download.adaptec.com/raid/storage_manager/${pkgname}_${_adaptec_ver}_${_adaptec_rel}.zip")
sha256sums=('d60af9796891ae6969a0c16761e1a742bc470cd6416153bfae8a6a2f5367254f')

pkgver() {
  _ver=`echo ${_adaptec_ver}|sed -e 's:v::' -e 's/_/./g'`
  echo -e "${_ver}_${_adaptec_rel}"
}

if [[ "$CARCH" == "i686" ]]; then
package() {
  pushd "${srcdir}/linux/cmdline"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  popd
}
fi

if [[ "$CARCH" == "x86_64" ]]; then
package() {
  pushd "${srcdir}/linux_x64/cmdline"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  popd
}
fi
