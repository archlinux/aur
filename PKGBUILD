# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
_pkgname=drone-runner-exec
_pkgver=1.0.0-beta.8
pkgver=${_pkgver//-/.}
pkgname=${_pkgname}-bin
pkgrel=1
pkgdesc="Drone pipeline runner that executes builds directly on the host machine."
arch=('x86_64')
url="https://github.com/drone-runners/drone-runner-exec"
license=('Polyform-Small-Business-1.0.0' 'Polyform-Free-Trial-1.0.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
backup=("etc/drone-runner-exec/config")
source=("https://github.com/drone-runners/${_pkgname}/releases/download/v${_pkgver}/drone_runner_exec_linux_amd64.tar.gz"
        "https://polyformproject.org/wp-content/uploads/2019/07/Polyform-Small-Business-1.0.0.txt"
        "https://polyformproject.org/wp-content/uploads/2019/07/Polyform-Free-Trial-1.0.0.txt")
sha512sums=('e146d70fcbd409303df43fd93a0fe15d4fade26383e35b968453b8507674dd6e6879892987fdb95d8bc0437f34b19064870030b0fa3bbf08b720611d5a757603'
            'bda25718a07cf06100017a5c94f825ffcd72b2470881de5014fe253aba8894807373fa0ed42531b34e1f26a7521cb4a709681e85408e55765a9349bf30127545'
            '4ac9388b3a8abfcfa42d31e1c7ccd2ab1aafe5d31264d9ed2b8c4f111f1fa070e72ed78081954862ff9cd816908a8bdfd12bb737d900ddb37622394511168424')

package() {
  cd "${srcdir}"
  install -Dm 755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm 644 "Polyform-Small-Business-1.0.0.txt" "${pkgdir}/usr/share/licenses/${pkgname}/Polyform-Small-Business-1.0.0.txt"
  install -Dm 644 "Polyform-Free-Trial-1.0.0.txt" "${pkgdir}/usr/share/licenses/${pkgname}/Polyform-Free-Trial-1.0.0.txt"
}
