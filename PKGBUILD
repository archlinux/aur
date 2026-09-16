    # Maintainer: lunagoat (https://github.com/lunagoat)
    # SPDX-License-Identifier: MIT
    pkgname=tty-terminal
    pkgver=1.0.0
    pkgrel=1
    pkgdesc='Linux TTY styling with the Kitty engine and native inline images'
    arch=('any')
    url='https://github.com/lunagoat/tty-terminal'
    license=('MIT' 'GPL-2.0-only')
    depends=('python>=3.11' 'kitty>=0.48.2' 'fontconfig')
    makedepends=('python-fonttools')
    checkdepends=('desktop-file-utils')
    source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
    sha256sums=('9c75908b98db67373f7c46a6f6c0157077a75269bb2f54030623277cb7629532')

    build() {
      cd "$pkgname-$pkgver"
      make PYTHON=/usr/bin/python
    }

    check() {
      cd "$pkgname-$pkgver"
      make check PYTHON=/usr/bin/python
    }

    package() {
      cd "$pkgname-$pkgver"
      make DESTDIR="$pkgdir" PREFIX=/usr install
    }
