# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=git-mirror-bin
pkgver=0.14.18
pkgrel=1
pkgdesc="Mirror external repositories to GitLab, GitHub and more"
arch=('x86_64')
url="https://github.com/bachp/git-mirror"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/git-mirror-v${pkgver}-linux-x86_64.tar.gz")
sha256sums_x86_64=('95298efebb75e522c709bd6a1453fad522254bceb80184f24696eedf3bf6e579')

package() {
  install -Dm755 "git-mirror" "${pkgdir}/usr/bin/git-mirror"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
