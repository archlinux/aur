# Maintainer: eggbertx <eggbertxdev at gmail dot com>
# Previous maintainer: Felix Golatofski <contact at xdfr dot de>
# Contributor: michaelchou <michaeljchou at the hotmail domain which is .com>

_pkgname=chakracore
pkgname=chakracore-bin
pkgver=1.11.24
pkgrel=2
pkgdesc='ChakraCore is an open source Javascript engine with a C API. This is the pre-built binaries from Microsoft.'
arch=('x86_64')
url='https://github.com/chakra-core/ChakraCore'
license=('MIT')
provides=('libChakraCore.so' 'ch')
conflicts=('chakracore-git' 'chakracore')
source=("https://chakra-core.shortdev.de/releases/v$pkgver/cc_linux_x64_1_11_24.tar.gz")
sha256sums=('939283618139D6C4223842D79C176C3691296BCE5368D54CB9805616A94EB605')

_dir="ChakraCoreFiles"

package() {
  install -Dm755 "$srcdir/$_dir/bin/ch" "$pkgdir/usr/bin/ch"

  install -Dm644 "$srcdir/$_dir/lib/libChakraCore.so" "$pkgdir/usr/lib/libChakraCore.so"

  for file in $srcdir/$_dir/include/*; do
    install -Dm644 "$file" "$pkgdir/usr/include/$(basename $file)"
  done

  install -Dm644 "$srcdir/$_dir/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
