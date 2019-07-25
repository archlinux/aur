# Maintainer: Sven Nobis <aur@sven.to>

pkgname=nmap-parse-output
pkgver=1.4.6
pkgrel=1
pkgdesc="Converts/manipulates/extracts data from a Nmap scan output."
arch=('any')
url="https://github.com/ernw/nmap-parse-output"
license=('BSD')
depends=('bash' 'libxslt')
optdepends=('bash-completion: Support for bash completion')

source=("$url/archive/v${pkgver}.tar.gz")
sha512sums=('4db57e021054a981a263bb17e00118dcb42a6bca060f3ba38812a79ab566a0d5fa8c2492224cfe00470517854796270cd7d1dd5fa9524010f1622e2d83b6a588')

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
