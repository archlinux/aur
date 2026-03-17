#Maintainer: Shadowbee <shadowbee.contact@proton.me>
pkgname=hister-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="Web history on steroids - blazing fast, content-based search for visited websites"
arch=('x86_64' 'aarch64')
conflicts=('hister' 'hister-git')
url="https://github.com/asciimoo/hister"
license=('AGPL-3.0-or-later')
depends=('sqlite')
install=hister.install
options=(!lto)
source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/hister_${pkgver}_linux_amd64"
  "hister.service"
  "LICENSE::https://raw.githubusercontent.com/asciimoo/hister/refs/heads/master/LICENSE")
source_aarch64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/hister_${pkgver}_linux_arm64"
  "hister.service"
  "LICENSE::https://raw.githubusercontent.com/asciimoo/hister/refs/heads/master/LICENSE")
sha256sums_x86_64=('8ae2e2600ffa6f9061e71ccf525e2ebc10150577a010f82c046978fa0a5e2a84' 'eb784ed318737413345da3db8d033854f7873fb59554cd06bc45ec0fa8b6ff3a' '57c8ff33c9c0cfc3ef00e650a1cc910d7ee479a8bc509f6c9209a7c2a11399d6')
sha256sums_aarch64=('fa6e5dc87dede4766106a3b657dba196184f37080b7903edc05a9fd70df0ebd7' 'eb784ed318737413345da3db8d033854f7873fb59554cd06bc45ec0fa8b6ff3a' '57c8ff33c9c0cfc3ef00e650a1cc910d7ee479a8bc509f6c9209a7c2a11399d6')

_ghrepo="asciimoo/hister"

package() {
  install -Dm755 hister-bin-${pkgver} "$pkgdir/usr/bin/hister"
  install -Dm644 "$srcdir/hister.service" "$pkgdir/usr/lib/systemd/user/hister.service"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
