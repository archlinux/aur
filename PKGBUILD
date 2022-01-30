# Maintainer: Ihor Kalnytskyi <ihor@kalnytskyi.com>

pkgname=ytcast-bin
_pkgname=${pkgname%-bin}
pkgver=1.0.0
pkgrel=1
pkgdesc='Cast YouTube videos to your smart TV from command-line'
arch=('x86_64')
url='https://github.com/MarcoLucidi01/ytcast'
license=('MIT')
source_x86_64=("$_pkgname-v$pkgver.tar.gz::$url/releases/download/v$pkgver/$_pkgname-v$pkgver-linux-amd64.tar.gz")
sha256sums_x86_64=('772be1860df3fb22b22737acf176aa62c9f9616307397498bf8ae1a382ea7ee0')
provides=("$_pkgname")

package() {
  cd "$srcdir/$_pkgname-v$pkgver-linux-amd64"

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 license "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
