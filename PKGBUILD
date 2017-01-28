# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

_adaptec_ver='v2_02'
_adaptec_rel='22404'
pkgname='arcconf'
pkgver=2.02_22404
pkgrel=1
pkgdesc='Adaptec command line interface utility'
arch=('i686' 'x86_64')
url='http://adaptec.com'
license=('freeware')
source=("http://download.adaptec.com/raid/storage_manager/${pkgname}_${_adaptec_ver}_${_adaptec_rel}.zip")
sha256sums=('dd9a555fb0993569e257856156d95f8ae7a89c780111409a26cd8ecded2e02bb')

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
