# Maintainer: <agustinballesteros04@gmail.com>
pkgname=llmfit-bin
_pkgname=llmfit
pkgver=0.9.6
pkgrel=1
pkgdesc="CLI tool to tell which LLM models will run best on your hardware"
arch=('x86_64')
url="https://github.com/AlexsJones/llmfit"
license=('MIT')
depends=('glibc')
provides=("$_pkgname")
conflicts=("$_pkgname")

source=("${_pkgname}-${pkgver}-linux.tar.gz::https://github.com/AlexsJones/llmfit/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('5077998128e1bf296dc8a12d652c52e707744b5587c9d53ee5d35b1be3a6d209')


package() {
  cd "${srcdir}/llmfit-v${pkgver}-x86_64-unknown-linux-gnu"

  install -Dm755 llmfit "$pkgdir/usr/bin/llmfit"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
