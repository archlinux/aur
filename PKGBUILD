# Maintainer: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname=code-server-noextract
pkgver=1.32.0_245
pkgrel=5
epoch=1
pkgdesc="This is a test, DO NOT install this"
conflicts=(code-server)
replaces=(code-server)
arch=('x86_64')
url="https://github.com/codercom/code-server"
license=(MIT)
makedepends=(tar curl)
#source=(https://github.com/codercom/code-server/releases/download/${pkgver//_/-}/code-server-${pkgver//_/-}-linux-x64.tar.gz)
#sha512sums=(SKIP)
noextract=(code-server-${pkgver//_/-}-linux-x64.tar.gz)

#build() {
#  cd "$srcdir"

#  echo 'Extracting...'
#  tar xf code-server-${pkgver//_/-}-linux-x64.tar.gz

#  cd "$srcdir/code-server-${pkgver//_/-}-linux-x64"
#}

package() {
  echo 'Downloading archive...'
  curl -L https://github.com/codercom/code-server/releases/download/${pkgver//_/-}/code-server-${pkgver//_/-}-linux-x64.tar.gz > archive.tar.gz

  echo 'Extracting archive...'
  tar xf archive.tar.gz

  cd archive

  echo 'Installing...'
  install -Dm755 code-server "$pkgdir"/usr/bin/code-server
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  echo 'Sleep for 5 seconds...'
  sleep 5

  #mkdir -p "$pkgdir"/usr/bin
  #mkdir -p "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  #cp code-server "$pkgdir"/usr/bin/code-server
  #cp LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  #chmod +x "$pkgdir"/usr/bin/code-server
}
