pkgname=rc-cpp
pkgver=1.0
pkgrel=1
pkgdesc="A simple script for compiling C++ code"
arch=("any")
license=("GPL")
package() {
  echo '#!/bin/bash

if g++ "$1.cpp" -o a.out; then
    echo "$1.cpp compiled successfully"
    echo ""
    ./a.out
else
    echo "Error: Compilation of $1.cpp failed"
fi

'> "${srcdir}/rc.sh"
  mkdir -p "${pkgdir}/usr/bin"
  cp "${srcdir}/rc.sh" "${pkgdir}/usr/bin/rc"
  chmod +x "${pkgdir}/usr/bin/rc"
}
