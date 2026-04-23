#Maintainer: Shadowbee <shadowbee.contact@proton.me>
pkgname=hister-bin
pkgver=0.13.0
pkgrel=1
pkgdesc="Web history on steroids - blazing fast, content-based search for visited websites"
arch=('x86_64' 'aarch64')
conflicts=('hister' 'hister-git')
url="https://github.com/asciimoo/hister"
license=('AGPL-3.0-or-later')
depends=('sqlite' 'postgresql')
install=hister.install
options=(!lto)
source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/hister_${pkgver}_linux_amd64"
  "hister.service"
  "LICENSE::https://raw.githubusercontent.com/asciimoo/hister/refs/heads/master/LICENSE")
source_aarch64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/hister_${pkgver}_linux_arm64"
  "hister.service"
  "LICENSE::https://raw.githubusercontent.com/asciimoo/hister/refs/heads/master/LICENSE")
sha256sums_x86_64=('c52e67cea51a936db06d82282d839b3d1adb28afcba18b9ce5c9c7c92ceae5ed' 'eb784ed318737413345da3db8d033854f7873fb59554cd06bc45ec0fa8b6ff3a' '57c8ff33c9c0cfc3ef00e650a1cc910d7ee479a8bc509f6c9209a7c2a11399d6')
sha256sums_aarch64=('b4fb3720e4407b08398eff72198af051e71c1a1095464fcf205c4e156b0700ac' 'eb784ed318737413345da3db8d033854f7873fb59554cd06bc45ec0fa8b6ff3a' '57c8ff33c9c0cfc3ef00e650a1cc910d7ee479a8bc509f6c9209a7c2a11399d6')

_ghrepo="asciimoo/hister"

package() {
  install -Dm755 hister-bin-${pkgver} "$pkgdir/usr/bin/hister"
  install -Dm644 "$srcdir/hister.service" "$pkgdir/usr/lib/systemd/user/hister.service"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
