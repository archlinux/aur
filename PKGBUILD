# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=naabu-bin
_pkgname="${pkgname%-bin}"
pkgver=2.1.0
pkgrel=1
pkgdesc='Fast port scanner with a focus on reliability and simplicity'
arch=('x86_64')
url='https://github.com/projectdiscovery/naabu'
license=('MIT')
depends=('libpcap')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('LICENSE'
        "README-$pkgver::https://raw.githubusercontent.com/projectdiscovery/naabu/v$pkgver/README.md")
source_x86_64=("$pkgname-$pkgver.zip::$url/releases/download/v$pkgver/naabu_${pkgver}_linux_amd64.zip")
sha256sums=('cbcdaab87df3175107aa28915bd253cebdd618a49c9ac5d6c669c0b1cbebcacb'
            '21fe0ba8d475cfb8f76a74684dad19208426f9f6e1790b4d47038cb6bfe16151')
sha256sums_x86_64=('2ed26dc22f79cea3cddfb3c4d9f583dd745f1d1bd5c5de1313e10f96d4dd5e58')

package() {
  install -D naabu -t "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/lib/"
  ## ugly hack to fix deps issue
  ln -s "/usr/lib/libpcap.so" "$pkgdir/usr/lib/libpcap.so.0.8"
  install -Dm644 "README-$pkgver" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim: ts=2 sw=2 et:
