    # Maintainer: lunagoat (https://github.com/lunagoat)
    # SPDX-License-Identifier: MIT
    pkgname=tty-terminal
    pkgver=1.0.0
    pkgrel=1
    pkgdesc='Vibe-coded terminal emulator that looks like a TTY interface'
    arch=('any')
    url='https://github.com/lunagoat/tty-terminal'
    license=('MIT' 'GPL-2.0-only')
    depends=('python>=3.11' 'kitty>=0.48.2' 'fontconfig')
    makedepends=('python-fonttools')
    checkdepends=('desktop-file-utils')
    source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
    sha256sums=('e5489a05030b5b9a36fa8d3b5e3eb3be7861c3c520c1e0d3172a39d5a7d626d2')

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
