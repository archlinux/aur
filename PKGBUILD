# Maintainer: Jona Miller <miller dot jona at yandex dot com>
# Contributor: Alex Epstein <epsteina at wit dot edu>
pkgname=bash-snippets
pkgver=1.23.0
pkgrel=1
pkgdesc="A collection of small bash scripts for heavy terminal users"
arch=('any')
url="https://github.com/alexanderepstein/Bash-Snippets"
license=('MIT')
depends=('bash' 'curl' 'openssl' 'git' 'bc')
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
md5sums=('SKIP')
_pkgname=Bash-Snippets
_tools=(bak2dvd bash-snippets cheat cloudup crypt cryptocurrency currency geo \
lyrics meme movies newton pwned qrify short siteciphers stocks taste todo \
transfer weather ytview)

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  for i in "${_tools[@]}"
  do
    install -Dm755 ./$i/$i -t "$pkgdir/usr/bin/"
  done
  install -Dm644 ./bash-snippets.1 -t "$pkgdir/usr/share/man/man1/"
  install -Dm644 ./README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 ./LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
