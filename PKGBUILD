# Maintainer: Jikstra <jikstra@disroot.org>
pkgname=serial2midi-git
pkgver=r1.f12db42
pkgrel=1
pkgdesc="Convert a USB Serial device to a Midi device "
arch=("any")
url="https://github.com/jikstra/serial2midi"
license=("GPL")
depends=('python-rtmidi' 'python-pyserial')
source=(
    "serial2midi-git::git://github.com/jikstra/serial2midi.git"
)

sha256sums=(
    "SKIP"
)


pkgver() {
    cd "$srcdir/${pkgname}"

    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
    cd "$srcdir/${pkgname}"
    
    install -Dm755 "${srcdir}/${pkgname}/main.py" "${pkgdir}/usr/bin/serial2midi"
}
 
