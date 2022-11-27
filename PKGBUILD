# Maintainer: Rasmus Lindroth <rasmus@lindroth.xyz>
_pkgname=tut
pkgname=tut-bin
pkgver=1.0.23
pkgrel=1
pkgdesc='A TUI for Mastodon with vim inspired keys. Same as aur/tut, but this is the binary version.'
arch=('x86_64' 'i686' 'aarch64' 'arm' 'armv6h' 'armv7h')
conflicts=('tut')
url="https://github.com/RasmusLindroth/$_pkgname"
license=('MIT')

source=("$_pkgname-$pkgver.tar.gz::https://github.com/RasmusLindroth/$_pkgname/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.23/tut-amd64-static")
source_i686=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.23/tut-386-static")
source_arm=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.23/tut-armv5-static")
source_armv6h=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.23/tut-armv6-static")
source_armv7h=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.23/tut-armv7-static")
source_aarch64=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.23/tut-arm64-static")

sha256sums=('0957ce0ba09f7638deb3301989159bdf4029aeef0fbdd8ea4a50289b33d47820')
sha256sums_x86_64=('d1d725db48b58edfd110fe26409e614f69cac504f215acf412b48a8afaa79053')
sha256sums_i686=('a26a5700a717b2a3cb72c222975d9ba9df98e211fba6d6c95a54c7ae0d4d4e99')
sha256sums_arm=('aa618c55f0713ed40c39d901c7e06e567907d9bdcce7be639f0e7b9aad6a247f')
sha256sums_armv6h=('f61d14be05592ded2acb59204c35642435a56388879ac1f748fd156f3308f35a')
sha256sums_armv7h=('09ab7ef8f9c2bbf65ee6099b35d74562567da63a5863494e4613d04eecfe7e85')
sha256sums_aarch64=('94172aae6450e574deb6cab993f2c9197b1a82897d144b9fd2bfcaf0fa0ac82c')

package() {
  install -Dm755 $pkgname-$pkgver-bin "$pkgdir"/usr/bin/$_pkgname

  cd $_pkgname-$pkgver
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$_pkgname/README.md
  install -Dm644 config.example.ini "$pkgdir"/usr/share/doc/$_pkgname/config.example.ini
  install -Dm644 config/toot.tmpl "$pkgdir"/usr/share/doc/$_pkgname/toot.tmpl
  install -Dm644 config/user.tmpl "$pkgdir"/usr/share/doc/$_pkgname/user.tmpl
}
