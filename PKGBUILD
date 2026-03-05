# Maintainer: <agustinballesteros04@gmail.com>
pkgname=llmfit-bin
_pkgname=llmfit
pkgver=0.6.2
pkgrel=1
pkgdesc="CLI tool to tell which LLM models will run best on your hardware"
arch=('x86_64')
url="https://github.com/AlexsJones/llmfit"
license=('MIT')
depends=('glibc')
provides=("$_pkgname")
conflicts=("$_pkgname")

source=("${_pkgname}-${pkgver}-linux.tar.gz::https://github.com/AlexsJones/llmfit/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('898cc5424719a0aeffd7563f55e51d091aaa6f9a6fb82e02a581a2f84371ceb5')


package() {
  cd "${srcdir}/llmfit-v${pkgver}-x86_64-unknown-linux-gnu"

  install -Dm755 llmfit "$pkgdir/usr/bin/llmfit"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
