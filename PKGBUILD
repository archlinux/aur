# Maintainer: Ihor Kalnytskyi <ihor@kalnytskyi.com>

pkgname=ytcast-bin
_pkgname=${pkgname%-bin}
pkgver=1.4.0
pkgrel=1
pkgdesc='Cast YouTube videos to your smart TV from command-line'
arch=('x86_64')
url='https://github.com/MarcoLucidi01/ytcast'
license=('MIT')
source_x86_64=("$_pkgname-v$pkgver.tar.gz::$url/releases/download/v$pkgver/$_pkgname-v$pkgver-linux-amd64.tar.gz")
sha256sums_x86_64=('25ec6a36ac75a71479ebbda6ab89055903460a65da658581b5af3e325c8a1782')
provides=("$_pkgname")

package() {
  cd "$srcdir/$_pkgname-v$pkgver-linux-amd64"

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 license "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
