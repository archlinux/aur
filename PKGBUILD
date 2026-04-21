# Maintainer: Berke Oruc <berke3oruc@gmail.com>
# Contributor: Berke Oruc <berke3oruc@gmail.com>

pkgname=bros-try
pkgver=1.0.0
pkgrel=2
pkgdesc="Try BROS operating system in QEMU - CLI tool"
arch=('any')
url="https://github.com/berkeai/bros-try"
license=('MIT')
depends=('python>=3.8' 'qemu')
makedepends=('python-setuptools')
optdepends=('qemu-guest-agent')
provides=('bros-try')
conflicts=('bros-try-git')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    
    python -m compileall bros_try/
    
    install -Dm755 "bros_try/cli.py" "$pkgdir/usr/bin/bros-try"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    mkdir -p "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
