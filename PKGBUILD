# Maintainer  : Patrick D. Lloyd <archlinux.org@pdlloyd.com>
# Contributor : Phillip K. Samuel <pintert3 at protonmail dot com>
# Contributor : Ben Ellis <benx45h@gmail.com>

pkgname=renode-bin
pkgver=1.15.0
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
	 'python-psutil')

source=("$pkgname-$pkgver-$pkgrel.tar.xz::https://github.com/renode/renode/releases/download/v${pkgver}/renode-${pkgver}-${pkgrel}-${arch}.pkg.tar.xz")

# checksum from package at time of pkgbuild
sha256sums=('ff8451766571b34e09e50d1bf8ad847506d07e65f03a38846af9ebf916bf73c2')

package() {
    cp -a "$srcdir/opt" "$pkgdir/opt" 
    cp -a "$srcdir/usr" "$pkgdir/usr"
    for licensefile in opt/renode/licenses/*; do
    	install -Dm644 "$licensefile" "$pkgdir/usr/share/licenses/$pkgname/$licensefile" 
    done
}
