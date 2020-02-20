# Maintainer: Max Strübing <mxstrbng@gmail.com>
pkgname=dotenv-linter-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="Linter for .env files. Written in Rust"
arch=('x86_64')
url="https://github.com/mgrachev/dotenv-linter"
license=('MIT')
provides=('dotenv-linter')
conflicts=('dotenv-linter-git')

package() {
  # Install binary
  mkdir dotenv-linter-bin 
  cd ${srcdir}/${pkgname}
  curl -O -L -C - https://github.com/mgrachev/dotenv-linter/releases/download/v1.1.1/dotenv-linter-linux-x86_64.tar.gz
  tar xzf dotenv-linter-linux-x86_64.tar.gz
  install -Dm 755 "${srcdir}/${pkgname}/dotenv-linter" "${pkgdir}/usr/bin/dotenv-linter"
}
