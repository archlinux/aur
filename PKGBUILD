# Maintainer: Sven Nobis <aur@sven.to>

pkgname=nmap-parse-output
pkgver=1.4.5
pkgrel=1
pkgdesc="Converts/manipulates/extracts data from a Nmap scan output."
arch=('any')
url="https://github.com/ernw/nmap-parse-output"
license=('BSD')
depends=('bash' 'libxslt')
optdepends=('bash-completion: Support for bash completion')

source=("$url/archive/v${pkgver}.tar.gz")
sha512sums=('096730c9f6444997ea69a90a09a3d5e11fad0d4d5e9b218fdbb344b5d1f17b2a0653aafde44655a4f114725ecb96579d1aebe289768f54fe5b03a177feadf41e')

package() {
  cd $srcdir/nmap-parse-output-$pkgver

  install -dm 755 "$pkgdir/usr/bin"
  install -dm 755 "$pkgdir/usr/share/$pkgname"
  install -dm 755 "$pkgdir/usr/share/bash-completion/completions"
  install -dm 755 "$pkgdir/usr/share/$pkgname/nmap-parse-output-xslt/"
  
  install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
  install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname/" demo.gif
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 644 ThirdPartyNotices.md "$pkgdir/usr/share/licenses/$pkgname/ThirdPartyNotices.md"
  
  install -Dm 644 _nmap-parse-output "$pkgdir/usr/share/bash-completion/completions/nmap-parse-output"
  
  install -Dm 755 -t "$pkgdir/usr/share/$pkgname/" nmap-parse-output
  install -Dm 644 -t "$pkgdir/usr/share/$pkgname/nmap-parse-output-xslt/" nmap-parse-output-xslt/*
  
  ln -sf "/usr/share/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
