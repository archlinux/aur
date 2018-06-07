# Maintainer: Alexis "Horgix" Chotard <alexis.horgix.chotard@gmail.com>

pkgname=scalingo-cli-bin
_pkgname=scalingo
pkgver=1.8.0
pkgrel=1
conflicts=('scalingo-cli')
pkgdesc="Scalingo (https://scalingo.com/) Command Line Interface - precompiled binary"
arch=('x86_64')
url="https://github.com/Scalingo/cli"
license=('BSD')
source=($_pkgname-$pkgver.tar.gz::"https://github.com/Scalingo/cli/releases/download/${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('4b0a7b727de1bb92d2caaf0a85d7cb4b084a4d93e2cd1a8ffabb8350a0b0d2ff')

package() {
  cd "${_pkgname}_${pkgver}_linux_amd64"

  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
