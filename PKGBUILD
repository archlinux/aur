# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=naabu-bin
_pkgname="${pkgname%-bin}"
pkgver=2.0.8
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
            '9f6960d65bb8972fa95843bbb02333aa8cdb34ad9555faee590b3c451eb3d66f')
sha256sums_x86_64=('4313cfdf49e1e2dd4e03000a1c560f949aeaf3d338543fb96b0faa0e7ab22372')

package() {
  install -D naabu -t "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/lib/"
  ## ugly hack to fix deps issue
  ln -s "/usr/lib/libpcap.so" "$pkgdir/usr/lib/libpcap.so.0.8"
  install -Dm644 "README-$pkgver" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim: ts=2 sw=2 et:
