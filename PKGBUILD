# Maintainer: kyndair <kyndair at gmail dot com>
pkgname=gogextract-yepoleb-git
_pkgname=gogextract
pkgver=r2.6601b32
pkgrel=1
pkgdesc="Separate the files in a gog mojo package."
arch=('any')
url="https://github.com/Yepoleb/gogextract"
license=('MIT')
provides=('gogextract')
conflicts=('gogextract')
source=('git+https://github.com/Yepoleb/gogextract.git')
sha256sums=('SKIP')

# update the package version to the current git version
pkgver() {
        cd "${srcdir}/${_pkgname}"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    # install executable
    install -Dm755 "${srcdir}/${_pkgname}/gogextract.py" "${pkgdir}/usr/bin/gogextract"
    #install readme.txt
    install -Dm644 "${srcdir}/${_pkgname}/README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
