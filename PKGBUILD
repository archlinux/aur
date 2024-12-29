# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="smolrtsp-libevent"
_commit_rel="c4d914648dc6832cc650b1eeb3b7c4e8914aaa68" # 0.1.0
_commit="7451e74a574e3d982bf175094aa0baa432cba7dd" # r1
pkgver="0.1.0+r1+g${_commit::7}"
pkgrel=1
pkgdesc="SmolRTSP + libevent 2.x"
arch=('any')
url="https://github.com/OpenIPC/${pkgname}"
license=('MIT')
depends=('libevent>=2')
_pkgsrc="${pkgname}-${_commit}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${_commit}.tar.gz")
sha256sums=('10859dbbe51f8fc1717843c914816bf0e0ca4564916ac9129cef29f1f05f31c0')

package() {
  cd "${srcdir}/${_pkgsrc}"
  find "include" -type f -exec install -vDm644 "{}" "${pkgdir}/usr/{}" \;

  install -vDm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
  install -vDm644 "LICENSE"      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
