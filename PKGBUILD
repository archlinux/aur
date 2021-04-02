# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
pkgname=hadolint
pkgver=2.1.0
pkgrel=1
pkgdesc='Dockerfile linter, validate inline bash, written in Haskell'
url='https://github.com/hadolint/hadolint/'
arch=('x86_64')
license=('GPL')
makedepends=('stack' 'libgmp-static')
conflicts=('hadolint-bin' 'hadolint-git')
source=("https://github.com/hadolint/hadolint/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e631a86392bdf6ebfed737f99f05558b7f06b063215180b41d6e9d7fb8fe6ce4')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    stack build hadolint
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm755 \
        .stack-work/install/*/*/*/bin/hadolint \
        "${pkgdir}/usr/bin/hadolint"
}

