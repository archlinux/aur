pkgname=aibox-bin
pkgver=2.0.1
pkgrel=1
pkgdesc="AI in a box. Run Claude in a secure microvm environment."
arch=('x86_64')
url="https://the127.github.io/aibox/"
license=('Apache-2.0')
depends=('qemu-system-x86' 'virtiofsd' 'bubblewrap')
provides=(aibox)
conflicts=(aibox)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/The127/aibox/releases/download/v${pkgver}/aibox_${pkgver}_linux_amd64.tar.gz")

sha256sums=('71fa6ba468b1b79a834e8eb2e770bbbfb2c11c1c61216f927063aa89ad059394')

package() {
    cd "$pkgname-$pkgver"
    install -Dm 755 aibox -t "$pkgdir/usr/bin"
    install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=4 sw=4 et:
