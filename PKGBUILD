# Maintainer: Ramadan Ali (alicavus) <rot13: ezqa@ezqa.ny>
_commit=e2fecc7e64b506e170736089d0af25c8aabc19e6
pkgname=simpleboot-bin
pkgver=1.0.0.re2fecc7e
pkgrel=2
pkgdesc="Dependency-free, all-in-one OS loader and bootable disk image creator."
arch=("x86_64")
url="https://gitlab.com/bztsrc/${pkgname%-bin}"
license=("MIT")
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${url}/-/raw/$_commit/distrib/${pkgname%-bin}_${pkgver::5}-amd64.deb")
b2sums=("491b908a06e4180586aca08ec859289063ea41259edfbf90b5b3a78b5d6c61055134c3668c3561475564dc42fceabfbff24bae9cd33e541cf88c5239fac34ae6")

pkgver() {
    echo "1.0.0.r${_commit::8}"
}

package() {
    bsdtar -xzf data.tar.gz -C $pkgdir
    find $pkgdir -type d -exec chmod 0755 {} \;
    find $pkgdir -exec chown root:root {} \;
}
