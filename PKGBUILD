# Maintainer: renyuneyun (Rui ZHAO) <renyuneyun@gmail.com>
pkgname=linux-enable-ir-emitter
_commit=63f0d73
pkgver=0.0.20210612.$_commit
pkgrel=1
pkgdesc='Enables infrared cameras that are not directly enabled out-of-the box.'
url='https://github.com/EmixamPP/linux-enable-ir-emitter'
license=('Unlicense')
depends=('python')
arch=('x86_64')
source=("git+https://github.com/EmixamPP/linux-enable-ir-emitter")
sha256sums=('SKIP')

build() {
    cd "$pkgname"
    git checkout $_commit
    make
}

package() {
    cd $srcdir/$pkgname
    install -Dm 755 -t $pkgdir/usr/bin/ linux-enable-ir-emitter
    install -Dm 755 -t $pkgdir/usr/lib/linux-enable-ir-emitter/ enable-ir-emitter
    install -Dm 755 -t $pkgdir/usr/lib/linux-enable-ir-emitter/ find-config-ir-emitter.py
    install -Dm 644 -t $pkgdir/usr/lib/linux-enable-ir-emitter/ config.yaml
    install -Dm 644 -t $pkgdir/usr/lib/systemd/system/ linux-enable-ir-emitter.service
}
