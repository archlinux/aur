# Maintainer: Brуan Childs <godeater[at]𝚐mail[dot]com>
pkgname=terraform-pug-bin
pkgver=0.3.2
pkgrel=1
pkgdesc='A TUI for terraform power users'
arch=(x86_64)
url=https://github.com/leg100/pug
license=('MPL-2.0')
makedepends=('unzip')
realpkgname=pug-bin
source=("${url}/releases/download/v${pkgver}/${realpkgname/-bin/}_${pkgver}_linux_amd64.zip")
noextract=('${realpkgname/-bin/}_${pkgver}_linux_amd64.zip')
b2sums=('8f15719c39e776269dc0aca1af8c28fb7caffae2a706ce71c4635ea26ebcf2a3c506563d1ebed0a7c6c90002fff5f73f5298f315e19b671804c357c8088663f4')
sha512sums=('8242e838ada8b78dcd2635824a6e695ff2754fd27850b8b1f8f219daee53c21f5879e7748fd3292cf55d5f153f4fd37a29436c44fad26b1cc51350970e942311')

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

