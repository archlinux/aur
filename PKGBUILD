# Maintainer: Shayne Hartford <shaybox@shaybox.com>

pkgname=python-aider-chat-git
pkgver=0.67.1.dev.r93.g42ae279
pkgrel=1
arch=("any")
url="https://github.com/Aider-AI/aider"
license=("Apache-2.0")
depends=("python" "python-pip")
makedepends=("git")
source=("${pkgname}::git+${url}.git")
sha512sums=("SKIP")

pkgver() {
    cd "${pkgname}"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${srcdir}/${pkgname}"
    python -m pip install --no-deps --prefix="${pkgdir}/usr" .
}
