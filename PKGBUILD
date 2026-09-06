# Maintainer: Julien Virey <julien.virey+aur@gmail.com>

pkgbase=tmtv-bin
groups=(tmtv-bin)
pkgname=(
  tmtv-bin
  tmtv-server-bin
)
pkgver=2.0.4
pkgrel=1
pkgdesc='Instant terminal sharing'
arch=(x86_64 aarch64)
url='https://github.com/sa3lej/tmtv'
_rawurl="${url/github.com/raw.githubusercontent.com}/refs/tags/v$pkgver"
license=('ISC')
provides=("${pkgbase%-bin}")
conflicts=("${pkgbase%-bin}")

depends=(ncurses)
source=("LICENSE_$pkgver::$_rawurl/LICENSE")

source_aarch64=(
  "${pkgname[0]}-$pkgver-aarch64::$url/releases/download/v$pkgver/${pkgname[0]%-bin}-linux-arm64v8"
  "${pkgname[1]}-$pkgver-aarch64::$url/releases/download/v$pkgver/${pkgname[0]%-bin}-linux-arm64v8"
)
source_x86_64=(
  "${pkgname[0]}-$pkgver-x86_64::$url/releases/download/v$pkgver/${pkgname[0]%-bin}-linux-amd64"
  "${pkgname[1]}-$pkgver-x86_64::$url/releases/download/v$pkgver/${pkgname[0]%-bin}-linux-amd64"
)
sha256sums=('04e2c1e023ea7ec42196398f6ffca492128dab7040d48e4c88857981ba4cc1b6')
sha256sums_x86_64=('fe1398228f82961133a5dd0de2e4cffe1b756add1b8724d88f2a51c375c07916'
                   'fe1398228f82961133a5dd0de2e4cffe1b756add1b8724d88f2a51c375c07916')
sha256sums_aarch64=('b9242225c16bef963da1cbe286585236d2045dc225cda791fb2910f2fd24052a'
                    'b9242225c16bef963da1cbe286585236d2045dc225cda791fb2910f2fd24052a')

package_tmtv-bin() {
  provides=("${pkgname%-bin}")
  conflicts=("${pkgname%-bin}")

  install -Dm755 "$pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/${pkgname%-bin}"
  install -Dm644 LICENSE_$pkgver -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_tmtv-server-bin() {
  provides=("${pkgname%-bin}")
  conflicts=("${pkgname%-bin}")

  install -Dm755 "$pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/${pkgname%-bin}"
  install -Dm644 LICENSE_$pkgver -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
