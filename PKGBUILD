# Maintainer: Sven Nobis <aur@sven.to>

pkgname=nmap-parse-output
pkgver=1.4.4
pkgrel=1
pkgdesc="Converts/manipulates/extracts data from a Nmap scan output."
arch=('any')
url="https://github.com/ernw/nmap-parse-output"
license=('BSD')
depends=('bash' 'libxslt')
optdepends=('bash-completion: Support for bash completion')

source=("$url/archive/v${pkgver}.tar.gz")
sha512sums=('75071344f3673695c1dd945e13e8613ca94b6d237dc4cacc664577124bc55f07738aa02536ae714a5f29a7e5619b821dc1ef298595bfb17f526d5c136554994a')

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
