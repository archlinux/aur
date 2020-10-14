# Maintainer: Nathan Robinson <nrobinson2000 at me dot com>

pkgname=neopo-git
_gitname="neopo"
pkgver=2020.10.13.3
pkgrel=1
pkgdesc="A lightweight solution for local Particle development."
arch=('x86_64' 'aarch64')
url="https://neopo.xyz"
license=('custom')
provides=('neopo')
source=('git+https://github.com/nrobinson2000/neopo.git')
md5sums=('SKIP')
depends=('libusb' 'python3' 'vim' 'git' 'perl-archive-zip')
depends_x86_64=('lib32-glibc')
depends_aarch64=('dfu-util' 'nodejs')

package() {
    cd $_gitname
    install -Dm 755 "neopo/neopo.py" "$pkgdir/usr/local/bin/neopo"
    install -Dm 644 "neopo/neopo-completion" "$pkgdir/usr/share/bash-completion/completions/neopo"
    install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
