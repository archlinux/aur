# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=1build-bin
pkgver=1.10.4
pkgrel=1
pkgdesc="Manage project-specific commands"
arch=('x86_64' 'aarch64')
url="https://github.com/gopinath-langote/1build"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/1build_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/1build_Linux_arm64.tar.gz")
sha256sums_x86_64=('7182db313924205c445b515082d6e5af16320cee6e2dab072a4412bb58ff008e')
sha256sums_aarch64=('328606d42a8f874df1bcf4b3ab24817fd1be0de9b96d1bf8135a626c79712ff4')

package() {
  install -Dm755 "1build" "${pkgdir}/usr/bin/1build"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
