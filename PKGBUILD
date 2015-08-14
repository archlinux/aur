# Maintainer:  Weirch Sodora <sodora at gmail dot com>
pkgname=upeditor
_pkgname=UPEditor
pkgver=1.0
pkgrel=1
pkgdesc='Security plugin for UnionPay Online Pay'
arch=('i686' 'x86_64')
url='https://www.95516.com/'
depends=('gcc-libs' 'glibc')
license=('custom')
if [ "$CARCH" = "i686" ]; then
    _installer="${_pkgname}-${pkgver}-Linux-x86-Install"
    md5sums=('79bc96e93953f88591c214016e03ff42')
    source=("https://user.95516.com/ctrl/${_pkgname}Linux_2.tar.gz")
elif [ "$CARCH" = "x86_64" ]; then
    _installer="${_pkgname}-${pkgver}-Linux-x86_64-Install"
    md5sums=('3610826fa7a4bcdc09a486007a028925')
    source=("https://user.95516.com/ctrl/${_pkgname}Linux64_2.tar.gz")
fi

build() {
    cd "${srcdir}"
    ./${_installer} --mode silent --prefix ${srcdir} --temp ${srcdir}
}

package() {
    install -D -m 644 "${srcdir}/libnpUPEditor.so" "${pkgdir}/usr/lib/mozilla/plugins/libnpUPEditor.so"
}

