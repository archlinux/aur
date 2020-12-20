# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
pkgname=hadolint
pkgver=1.19.0
pkgrel=1
pkgdesc='Dockerfile linter, validate inline bash, written in Haskell'
url='https://github.com/hadolint/hadolint/'
arch=('x86_64')
license=('GPL')
makedepends=('git' 'stack')
conflicts=('hadolint-bin' 'hadolint-git')
source=("git+https://github.com/hadolint/hadolint.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}"

    stack build hadolint
}

package() {
    cd "${srcdir}/${pkgname}"

    install -Dm755 \
        .stack-work/install/*/*/*/bin/hadolint \
        "${pkgdir}/usr/bin/hadolint"
}

