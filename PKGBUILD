# Maintainer: <agustinballesteros04@gmail.com>
pkgname=llmfit-bin
_pkgname=llmfit
pkgver=0.5.3
pkgrel=1
pkgdesc="CLI tool to tell which LLM models will run best on your hardware"
arch=('x86_64')
url="https://github.com/AlexsJones/llmfit"
license=('MIT')
depends=('glibc')
provides=("$_pkgname")
conflicts=("$_pkgname")

source=("${_pkgname}-${pkgver}-linux.tar.gz::https://github.com/AlexsJones/llmfit/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('c408f29bf50a9ce8e80a287f4c9d945b7e94f94908d21faff33f82cf5c814f3a')


package() {
  cd "${srcdir}/llmfit-v${pkgver}-x86_64-unknown-linux-gnu"

  install -Dm755 llmfit "$pkgdir/usr/bin/llmfit"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
