# Maintainer: Brуan Childs <godeater[at]𝚐mail[dot]com>
pkgname=kbst-bin
pkgver=0.2.1
pkgrel=1
pkgdesc='CLI for the Kubestack GitOps Framework'
arch=(x86_64)
url=https://github.com/kbst/kbst
license=('MIT')
makedepends=('unzip')
source=("${url}/releases/download/v${pkgver}/${pkgname/-bin/}_linux_amd64.zip")
noextract=('${pkgname/-bin/}_linux_amd64.zip')
b2sums=('2d5339bac59fa5382c27831c7544ff0db59642369835817746d6bf62a1a9e71d7e119bbd6b17d9cd8d89dc761da3272674647ace606384207b99ff85c24aee79')
sha512sums=('7812f95be39d4ff4d69dc62221b73b8c1315aa241231cb2b7cff89bf50d60908d191f3acf2939cdfc12c42426628a219cc5777dcc7c1e961b1e85a3eda691ac9')

prepare() {
  unzip -d ${srcdir}/${pkgname/-bin/}_${pkgver}_${pkgrel} ${pkgname/-bin/}_linux_amd64.zip
}

package() {
  _output="${srcdir}/${pkgname/-bin/}_${pkgver}_${pkgrel}"
  install -Dm755 "${_output}/${pkgname/-bin/}" "${pkgdir}/usr/bin/${pkgname/-bin/}"
  install -Dm644 "${_output}/LICENSE" "${pkgdir}/usr/share/${pkgname/-bin/}/LICENSE"
  install -Dm644 "${_output}/README.md" "${pkgdir}/usr/share/${pkgname/-bin/}/README.md"
}

