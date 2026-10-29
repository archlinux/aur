# Maintainer: Brуan Childs <godeater[at]𝚐mail[dot]com>
pkgname=terraform-pug-bin
pkgver=0.6.5
pkgrel=1
pkgdesc='A TUI for terraform power users'
arch=(x86_64)
url=https://github.com/leg100/pug
license=('MPL-2.0')
makedepends=('unzip')
realpkgname=pug-bin
source=("${url}/releases/download/v${pkgver}/${realpkgname/-bin/}_${pkgver}_linux_amd64.zip")
noextract=('${realpkgname/-bin/}_${pkgver}_linux_amd64.zip')
b2sums=('48e38a84f3fc10d828cc364b50fc97ad97501d3f548d785b955cc885b6e1809f14e400b48b6bfde610337fdf2e5062f0a3b9ab46df44aa6eff8a6f9aff5edd13')
sha512sums=('2309657fd025235910544e4a19ca15b92f0da861d9cbb4bedf51b524c45f609c017557eb9e596ebb6fde172eccf963a205094b58e10f86afbe793976494985c6')

prepare() {
  unzip -d ${srcdir}/${realpkgname/-bin/}_${pkgver}_${pkgrel} ${realpkgname/-bin/}_${pkgver}_linux_amd64.zip
}

package() {
  _output="${srcdir}/${realpkgname/-bin/}_${pkgver}_${pkgrel}"
  install -Dm755 "${_output}/${realpkgname/-bin/}" "${pkgdir}/usr/bin/${realpkgname/-bin/}"
  install -Dm644 "${_output}/LICENSE" "${pkgdir}/usr/share/${pkgname/-bin/}/LICENSE"
  install -Dm644 "${_output}/README.md" "${pkgdir}/usr/share/${pkgname/-bin/}/README.md"
  install -Dm644 "${_output}/CHANGELOG.md" "${pkgdir}/usr/share/${pkgname/-bin/}/CHANGELOG.md"
}

