# Maintainer: Dwi Mulia Mokoginta <dwi-mulia-mokoginta@protonmail.com>

_pkgname="pydio-cells"
pkgname="$_pkgname-bin"
pkgver=4.4.7
pkgrel=1
pkgdesc="Pydio Cells is the nextgen file sharing platform for organizations."
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/pydio/cells"

depends=('glibc' 'go')
options=('!debug')

conflicts=('pydio-cells' 'pydio')
replaces=('pydio-cells' 'pydio')
provides=('pydio-cells' 'pydio')

source_x86_64=(
  "$_pkgname-$pkgver.zip::https://download.pydio.com/pub/cells/release/4.4.7/linux-amd64/$_pkgname-$pkgver-linux-amd64.zip"
  "LICENSE::https://raw.githubusercontent.com/pydio/cells/refs/heads/main/LICENSE"
)

sha256sums_x86_64=(
  '655149432e3c3eb8111a219f82faf284cc0f010535a14526535f44d31d3674e3'
  '76a97c878c9c7a8321bb395c2b44d3fe2f8d81314d219b20138ed0e2dddd5182'
)

source_armv7h=(
  "$_pkgname-$pkgver-armv7h.zip::https://download.pydio.com/pub/cells/release/4.4.7/linux-amd64/$_pkgname-$pkgver-linux-arm.zip"
  "LICENSE::https://raw.githubusercontent.com/pydio/cells/refs/heads/main/LICENSE"
)

sha256sums_armv7h=(
  '0df328ec917b70028259694287630ad99625c9ec1c17413e2199266fc8b8a4cc'
  '76a97c878c9c7a8321bb395c2b44d3fe2f8d81314d219b20138ed0e2dddd5182'
)

source_aarch64=(
  "$_pkgname-$pkgver-aarch64.zip::https://download.pydio.com/pub/cells/release/4.4.7/linux-amd64/$pkgname-$pkgver-linux-arm64.zip"
  "LICENSE::https://raw.githubusercontent.com/pydio/cells/refs/heads/main/LICENSE"
)

sha256sums_aarch64=(
  '5a18874e3f8ac3fad6f25916838bd750d06ed71d8dae721365ed268f1b7c73eb'
  '76a97c878c9c7a8321bb395c2b44d3fe2f8d81314d219b20138ed0e2dddd5182'
)

package() {
  cd "$srcdir/"

  install -Dm755 cells -t "$pkgdir/usr/bin"
  install -Dm755 cells-fuse -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/linceses/pydio-cells"
}

package_armv7h() {
  cd "$srcdir/"

  install -Dm755 cells -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
}

package_aarch64() {
  cd "$srcdir/"

  install -Dm755 cells -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
}
