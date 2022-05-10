# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=naabu-bin
pkgver=2.0.7
pkgrel=1
pkgdesc='Fast port scanner with a focus on reliability and simplicity'
arch=('x86_64')
url='https://github.com/projectdiscovery/naabu'
license=('MIT')
depends=('libpcap')
provides=("naabu")
conflicts=("naabu")
source=('LICENSE'
        "README-$pkgver::https://raw.githubusercontent.com/projectdiscovery/naabu/v$pkgver/README.md")
source_x86_64=("$pkgname-$pkgver.zip::$url/releases/download/v$pkgver/naabu_${pkgver}_linux_amd64.zip")
sha256sums=('cbcdaab87df3175107aa28915bd253cebdd618a49c9ac5d6c669c0b1cbebcacb'
            '4265747a29ad0d3826bb42c17470894da10c5731699cc13a4a34d6237566290f')
sha256sums_x86_64=('7ab7183da28b11539c135cce0831c6bc44a605857240a457e94e45ab49afcd3b')

package() {
  install -D naabu -t "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/lib/"
  ## ugly hack to fix deps issue
  ln -s "/usr/lib/libpcap.so" "$pkgdir/usr/lib/libpcap.so.0.8"
  install -Dm644 "README-$pkgver" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim: ts=2 sw=2 et:
