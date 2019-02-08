# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=opensearchserver
pkgver=1.5.14
pkgrel=1
pkgdesc='The open-source enterprise class search engine software'
arch=('any')
url='http://www.opensearchserver.com'
license=('GPL')
depends=('java-runtime-common')
_commitsha1='d0d167e'
source=(
  "http://sourceforge.net/projects/opensearchserve/files/Stable_release/${pkgver}/${pkgname}-${pkgver}-${_commitsha1}.zip"
  'opensearchserver.service'
  'start.sh'
  'stop.sh')
md5sums=(
  '07104dd4fff4174833e3678c57c04d1b'
  'SKIP'
  'SKIP'
  'SKIP')

package() {
  _dest=${pkgdir}/usr/share/${pkgname}
  install -d "${_dest}"
  install -m644 "${srcdir}/${pkgname}/LICENSE.txt" "${_dest}"
  install -m644 "${srcdir}/${pkgname}/${pkgname}.jar" "${_dest}"
  install -m644 "${srcdir}/${pkgname}/${pkgname}.war" "${_dest}"
  install -m644 "${srcdir}/start.sh" "${_dest}"
  install -m644 "${srcdir}/stop.sh" "${_dest}"

  install -d "${pkgdir}/usr/lib/systemd/system"
  install -m644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
