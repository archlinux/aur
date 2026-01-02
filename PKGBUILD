# Maintainer: malwareslayer <dwi-mulia-mokoginta@protonmail.com>
# Maintainer: dragomang87 <ahnufdyg6@mozmail.com>

_pkgname="pydio-cells"
pkgname="$_pkgname-bin"
pkgver=4.4.9
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
  "$_pkgname-$pkgver.zip::https://download.pydio.com/pub/cells/release/$pkgver/linux-amd64/$_pkgname-$pkgver-linux-amd64.zip"
  "LICENSE::https://raw.githubusercontent.com/pydio/cells/refs/heads/main/LICENSE"
)

source_armv7h=(
  "$_pkgname-$pkgver-armv7h.zip::https://download.pydio.com/pub/cells/release/$pkgver/linux-arm/$_pkgname-$pkgver-linux-arm.zip"
  "LICENSE::https://raw.githubusercontent.com/pydio/cells/refs/heads/main/LICENSE"
)

source_aarch64=(
  "$_pkgname-$pkgver-aarch64.zip::https://download.pydio.com/pub/cells/release/$pkgver/linux-arm64/$_pkgname-$pkgver-linux-arm64.zip"
  "LICENSE::https://raw.githubusercontent.com/pydio/cells/refs/heads/main/LICENSE"
)


sha256sums_x86_64=('ec8a0f3bd466769e6bede13f1a77be080af156a4c6bc01f65b30634340ae6ddb'
                   '76a97c878c9c7a8321bb395c2b44d3fe2f8d81314d219b20138ed0e2dddd5182')
sha256sums_armv7h=('3ed3c34788845657b4d781e8bc157e5a8edd8de42aeb045e189a492489e8a555'
                   '76a97c878c9c7a8321bb395c2b44d3fe2f8d81314d219b20138ed0e2dddd5182')
sha256sums_aarch64=('232a560800318ae5e5700e237e05b7500eccd39f02699eba5b0cb7c8bc979e31'
                    '76a97c878c9c7a8321bb395c2b44d3fe2f8d81314d219b20138ed0e2dddd5182')


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
