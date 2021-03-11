# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=retry-git
pkgver=0.1
pkgrel=2
pkgdesc="A retry command for bash"
arch=('any')
url="https://gist.github.com/felipou/6fbec22c4e04d3adfae5"
license=('unknown')
source=("https://gist.githubusercontent.com/felipou/6fbec22c4e04d3adfae5/raw/f803b5fca747315894bc4e9b2993f7d9eee050e4/retry.sh")
sha512sums=('330a1df349c27dd27da6bc4367406d2a7d494e0bb80bffb91aed1f2c3cdf2d0b1506663aa8e38a19f1ff11da879f2b7da569a8c4d87bd6296fd84e1692d42b33')

prepare() {
  sed -i '1i#!/usr/bin/bash' retry.sh
  sed -i -e '$aretry $@' retry.sh
}

package() {
  install -Dm755 retry.sh "${pkgdir}/usr/bin/retry"
}

