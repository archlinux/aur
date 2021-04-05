# Maintainer: Andrew Gunnerson <accounts+arch@chiller3.com>

pkgname=baad
pkgver=01
pkgrel=1
pkgdesc="Extracts various sections from the Twilight Princess Z2Sound.baa file"
arch=('i686' 'x86_64')
url="https://hcs64.com/files/"
license=('GPL')
source=("https://hcs64.com/files/${pkgname}${pkgver}.zip")
sha512sums=('a7dcb1d70460fee85955bd25df2839c0d1302dff8ca97d3d231445ebff81dfd8887595211e19d52df03cce984103501512884b1e5a56b794992e15e78e9a649a')

build() {
  cd "${srcdir}"

  # Compile bst
  gcc bst.c -o bst

  # Compile baad
  gcc baad.c -o baad
}

package() {
  cd "${srcdir}"

  # Install bst
  install -Dm755 bst "${pkgdir}/usr/bin/bst"
  install -Dm755 baad "${pkgdir}/usr/bin/baad"
}

# vim:set ts=2 sw=2 et:
