# Maintainer: Slash <demodevil5[at]yahoo[dot]com>

pkgname=defrag
pkgver=0.08
pkgrel=2
pkgdesc="A braindead simple and filesystem agnostic defragmentation script"
url="http://ck.kolivas.org/apps/defrag/"
license=()
depends=('bash')
arch=('any')
source=("http://ck.kolivas.org/apps/defrag/$pkgname-$pkgver/defrag" 'shellcheck-fixes.patch')
sha512sums=('fa1c9c3a58ec43020a6a1da66bcbf8304e9b2ad1afbd25c0aab0962410e977412954669be2ae2aaaf8b14b2294cad91bbb0143f589688aa684080dff1b2c5316'
            'bd562680b4c049a1e9b1704b2da2f94f7ba8037625f0a6501d75417d90cce09d10fc59ecd2e0c8f49252d7a7868da36ec2e810a660adefa76b6cc1ce6ecc2f42')

prepare() {
    cd "${srcdir}"

    patch --follow-symlinks -p1 -i shellcheck-fixes.patch
}

package() {
    cd "${srcdir}"

    install -D -m755 defrag "${pkgdir}/usr/bin/defrag"
}

