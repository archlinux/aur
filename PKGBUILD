# Maintainer: Adrien 'Litarvan' Navratil <adrien1975@live.fr>
pkgname=epita-68k-sdk
pkgver=1.0.0
pkgrel=1
pkgdesc='EPITA 68k development kit for the third semester computer architecture practicals'
arch=(x86_64)
url=http://www.debug-pro.com/epita/archi/s3/en/
license=('custom')
depends=(qt5-base)
makedepends=()
source=('http://www.debug-pro.com/epita/archi/s3/TP_68000_Ubuntu64.tar.gz', 'a68k-fast')
md5sums=('5d748ed7be0d8f3a25ec6016e7282df8' '8ddd44aca5a0b18e3a1ffee345098681')

package() {
    cd "${srcdir}/TP_68000_Ubuntu64"

    for file in a68k d68k; do
        install -Dm755 ./68000/"${file}" "${pkgdir}"/usr/bin/"${file}"
    done

    for file in libM68000.so.1 libSplittingView.so.1; do
        install -Dm755 ./68000/"${file}" "${pkgdir}"/usr/lib/"${file}"
    done

    cd ..

    install -Dm755 ./a68k-fast "${pkgdir}"/usr/bin/a68k-fast
}
