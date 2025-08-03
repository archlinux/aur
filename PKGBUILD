# Maintainer  : Patrick D. Lloyd <archlinux.org@pdlloyd.com>
# Contributor : Phillip K. Samuel <pintert3 at protonmail dot com>
# Contributor : Ben Ellis <benx45h@gmail.com>

pkgname=renode-bin
pkgver=1.16.0
pkgrel=1
pkgdesc="A virtual development framework for multinode embedded networks"
url="https://www.renode.io"
arch=('x86_64')
license=('MIT')
provides=('renode'
          'libllvm-disas.so')

depends=('mono'
         'gtk-sharp-2'
         'screen'
         'polkit'
         'gcc'
         'python'
	 'python-pip'
	 'python-yaml'
	 'python-pyelftools'
	 'python-psutil'
	 'python-pandas'
	 'python-matplotlib'
	 'python-pexpect')

source=("$pkgname-$pkgver-$pkgrel.tar.xz::https://github.com/renode/renode/releases/download/v${pkgver}/renode-${pkgver}-${pkgrel}-${CARCH}.pkg.tar.xz")

# checksum from package at time of pkgbuild
sha256sums=('be7e94e4367a52fe73acabde27a99b98d7538b61fcd0d8b97f8a73b9283028ed')

package() {
    cp -a "$srcdir/opt" "$pkgdir/opt" 
    cp -a "$srcdir/usr" "$pkgdir/usr"
    for licensefile in opt/renode/licenses/*; do
    	install -Dm644 "$licensefile" "$pkgdir/usr/share/licenses/$pkgname/$licensefile" 
    done
}
