# Maintainer: Shalygin Konstantin <k0ste@cn.ru>

_adaptec_ver='v2_00'
_adaptec_rel='21811'
pkgname='arcconf'
pkgver=2.00_21811
pkgrel=1
pkgdesc='Adaptec command line interface utility'
arch=('i686' 'x86_64')
url='http://adaptec.com'
license=('freeware')
source=("http://download.adaptec.com/raid/storage_manager/${pkgname}_${_adaptec_ver}_${_adaptec_rel}.zip")
sha256sums=('4b4ac5d496172af8a5d9148cfa2ea6337b476dfd51a7585426102551363acaa3')

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
