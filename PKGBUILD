# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

_pkgname="scanrepo"
pkgname="${_pkgname}-bin"
pkgver=0.4.1
pkgrel=1
pkgdesc="CLI tool that finds secrets accidentally committed to a git repo, eg passwords, private keys"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/UKHomeOffice/repo-security-scanner"
_url="https://github.com/techjacker/repo-security-scanner"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${_url}/releases/download/${pkgver}/repo-security-scanner_${pkgver}_Linux_x86_64.tar.gz")
source_i686=("${_url}/releases/download/${pkgver}/repo-security-scanner_${pkgver}_Linux_i386.tar.gz")
source_aarch64=("${_url}/releases/download/${pkgver}/repo-security-scanner_${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('6bdd67dcefcf2c9e0461b2b98023281a3ae5ae72a7b452f1f94ce608c4554e89')
sha256sums_i686=('e7e839c77e52feceae868eab88a1edffb5fc7e27dfdfef62e03b2883ade1c2d1')
sha256sums_aarch64=('34f3ee6ecf70fc6104be8bfbb1203bcbc266a7d1a4ee4b34589c7e2046cf6517')

package() {
  cd "${srcdir}"
  install -Dm755 "repo-security-scanner" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
