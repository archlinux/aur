# Maintainer: Evan Chen <evan@evanchen.cc>

pkgname=pythowo
pkgver=1.0
pkgrel=1
pkgdesc='an UwU programming language'
arch=(any)
url=https://github.com/virejdasani/pythOwO
license=(MIT)
depends=(python)
source=(
  "git+https://github.com/virejdasani/pythOwO.git#commit=57ee3e3"
  LICENSE)
sha256sums=('ec9466cb6254adad0c2c77f4beeefda88363cc23484ded5e9e61648f362a3e09'
  '4667624e4a75bebe577e476bee730570b49917bed088d1dc7fc71529525303de')

check() {
  cd "$srcdir/pythOwO"
  python -m unittest discover || return 1
}

package() {
  cd "$srcdir/pythOwO"

  install -Dm755 pythowo.py "$pkgdir/usr/share/pythowo/pythowo.py"
  install -Dm755 shwell.py "$pkgdir/usr/share/pythowo/shwell.py"
  install -Dm644 stwings_with_awwows.py "$pkgdir/usr/share/pythowo/stwings_with_awwows.py"

  sed -i '1i#!/usr/bin/env python3' "$pkgdir/usr/share/pythowo/pythowo.py"
  sed -i '1i#!/usr/bin/env python3' "$pkgdir/usr/share/pythowo/shwell.py"

  mkdir -p "$pkgdir/usr/bin"
  ln -s /usr/share/pythowo/pythowo.py "$pkgdir/usr/bin/owo"
  ln -s /usr/share/pythowo/shwell.py "$pkgdir/usr/bin/shwell"
}
