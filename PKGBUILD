# Maintainer: Soymadip <soumadip@zohomail.in>

pkgname=ireader-bin
pkgver=2.0.17
pkgrel=1
pkgdesc="Open source novel reader"
arch=('x86_64')
license=('Apache-2.0')

_repo="IReaderorg/IReader"
url="https://github.com/${_repo}"

depends=('java-runtime>=17')
provides=('ireader')
conflicts=('ireader')
options=('!strip')

_jar="IReader-linux-x64-${pkgver}.jar"
source=(
  "ireader"
  "ireader.desktop"
  "IReader.jar::${url}/releases/download/v${pkgver}/${_jar}"
  "ireader.png::https://raw.githubusercontent.com/${_repo}/master/desktop/src/main/resources/icon.png"
  "LICENSE::https://raw.githubusercontent.com/${_repo}/master/LICENSE"
)

noextract=("IReader.jar")

sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

package() {

  msg2 "Installing JAR"
  install -Dm644 IReader.jar \
    "$pkgdir/usr/lib/ireader/IReader.jar"

  msg2 "Installing launcher"
  install -Dm755 ireader \
    "$pkgdir/usr/bin/ireader"

  msg2 "Installing desktop file"
  install -Dm644 ireader.desktop \
    "$pkgdir/usr/share/applications/ireader.desktop"

  msg2 "Installing icon"
  install -Dm644 ireader.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/ireader.png"

  msg2 "Installing license"
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
