# Maintainer: Julien Virey <julien.virey+aur@gmail.com>

pkgbase=tmtv-bin
groups=(tmtv-bin)
pkgname=(
  tmtv-bin
  tmtv-server-bin
)
pkgver=2.0.2
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
sha256sums_x86_64=('fb42121e4358b874d91c8a2664bbe41a921127f275c82d4b83cced6f9a1be418'
                   'fb42121e4358b874d91c8a2664bbe41a921127f275c82d4b83cced6f9a1be418')
sha256sums_aarch64=('7da2da96d6245173f4ab31c75c561008e25e8a7df4197e34362ac53a2d2022f8'
                    '7da2da96d6245173f4ab31c75c561008e25e8a7df4197e34362ac53a2d2022f8')

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
