# Maintainer: Sven Nobis <aur@sven.to>

pkgname=nmap-parse-output
pkgver=1.4.4
pkgrel=2
pkgdesc="Converts/manipulates/extracts data from a Nmap scan output."
arch=('any')
url="https://github.com/ernw/nmap-parse-output"
license=('BSD')
depends=('bash' 'libxslt')
optdepends=('bash-completion: Support for bash completion')

source=("$url/archive/v${pkgver}.tar.gz")
sha512sums=('aa45918a031323ce0df984ef34a235e22befb8b7935a0c3782240313fd0eae9c95dcc923e702e5646c192154291e3551d767b98a18ce1da53c61acf91732ded2')

package() {
  cd $srcdir/nmap-parse-output-$pkgver

  install -dm 755 "$pkgdir/usr/bin"
  install -dm 755 "$pkgdir/usr/share/$pkgname"
  install -dm 755 "$pkgdir/usr/share/bash-completion/completions"

  install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 644 ThirdPartyNotices.md "$pkgdir/usr/share/licenses/$pkgname/ThirdPartyNotices.md"

  install -Dm 644 _nmap-parse-output "$pkgdir/usr/share/bash-completion/completions/nmap-parse-output"
  
  rm README.md LICENSE ThirdPartyNotices.md _nmap-parse-output

  cp -a * "$pkgdir/usr/share/$pkgname/"

  ln -sf "/usr/share/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
