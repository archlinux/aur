# Maintainer: Ferenc Kollár
# Contributor: Bastien "neitsab" Traverse <neitsab@archlinux.org>
# Contributor: Dawid Weglarz <dawid.weglarz95@gmail.com>

pkgname=bat-asus-battery-bin
pkgver=1.2
pkgrel=1
pkgdesc="Replicate the functionality of the ASUS Battery Health Charging on Windows which aims prolong the battery's life-span"
arch=("x86_64")
url="https://github.com/tshakalekholoane/bat"
license=('MIT')
provides=('bat-asus-battery')
source=(${pkgname%-bin}::"${url}/releases/download/${pkgver}/bat"
    ${pkgname%-bin}.1::"https://raw.githubusercontent.com/tshakalekholoane/bat/${pkgver}/bat.1"
    "https://github.com/tshakalekholoane/bat/raw/refs/tags/${pkgver}/LICENSE"
    )
sha256sums=('7f209814f7e8da71d0aa7699ec0bb7a5f589a8af006756b24accab6a4c8c4d4b'
            '269d367998d72a0b5d75ab6700ef5ceba3beadfc36ccf52aaf61108b81c7668e'
            '3db949f65e37956d9e070b785231b16eafc97453760bf6408c7fc5dbe3d816f4')

package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin/"
    install -Dm644 "${srcdir}/${pkgname%-bin}.1" -t "${pkgdir}/usr/share/man/man1/"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
