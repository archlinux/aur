# Maintainer: Phuwit Puthipairoj <26784267+phuwit@users.noreply.github.com>

pkgname=mark2-git
pkgver=r826.24db946
pkgrel=1
pkgdesc='A minecraft server wrapper, written in python and twisted.'
arch=(any)
url=https://github.com/mark2devel/mark2
license=('MIT')
makedepends=(git)
depends=(python python-psutil python-urwid python-twisted python-service-identity python-feedparser python-pyopenssl xclip python-pyperclip python-twisted python-psutil python-urwid python-treq)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+"${url}".git)
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${pkgname%-git}"
    install -Dm755 mark2 "${pkgdir}/usr/bin/"${pkgname%-git}""
    # install -Dm644 COPYING "$pkgdir/usr/share/licenses/"${pkgname%-git}"/LICENSE"
    # install -Dm755 mk2/* -t "${pkgdir}/usr/bin/"${pkgname%-git}"/mk2"
    cp -r mk2/ "${pkgdir}/usr/bin/mk2"
    chmod -R 755 "${pkgdir}/usr/bin/"${pkgname%-git}""
}
