# Maintainer: nagyation  <mnagy1312@gmail.com>
pkgname=focus-git
_newpkgname=Focus
pkgver=r42.7626df4
pkgrel=1
pkgdesc="A desktop notification based app that keeps you focused"
arch=(x86_64)
url="https://github.com/nagyation/Focus"
license=('GPL')
depends=('gtk2' 'libnotify')
makedepends=('git')
source=("git+https://github.com/nagyation/Focus.git")
md5sums=('SKIP')

pkgver() {
        cd "$_newpkgname"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
        cd "$_newpkgname"
        make
}

package() {
        cd "$_newpkgname"
        install -D -m644 "License.txt" "${pkgdir}/usr/share/licenses/${_newpkgname}/LICENSE"
        install -D -m755 "focus" "${pkgdir}/usr/bin/focus"
        install -D -m755 "resources/focus_icon.png" "${pkgdir}/usr/share/focus/focus_icon.png"
}
