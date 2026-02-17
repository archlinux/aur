# Maintainer  : Maxim De Clercq <maximdeclercq00@gmail.com>
# Contributor : Patrick D. Lloyd <archlinux.org@pdlloyd.com>
# Contributor : Phillip K. Samuel <pintert3 at protonmail dot com>
# Contributor : Ben Ellis <benx45h@gmail.com>

pkgname=renode-bin
pkgver=1.16.1
pkgrel=1
pkgdesc="A virtual development framework for multinode embedded networks"
url="https://www.renode.io"
arch=('x86_64')
license=('MIT')
provides=('renode'
          'libllvm-disas.so')

depends=('dotnet-runtime'
         'gcc'
         'polkit'
         'python'
         'python-matplotlib'
         'python-pandas'
         'python-pexpect'
         'python-pip'
         'python-psutil'
         'python-pyelftools'
         'python-yaml'
         'screen')

source=("$pkgname-$pkgver-$pkgrel.tar.xz::https://github.com/renode/renode/releases/download/v${pkgver}/renode-${pkgver}-${pkgrel}-${CARCH}.pkg.tar.xz")

# checksum from package at time of pkgbuild
sha256sums=('72a73ebfbc0e04e398d72fda6249bba8ae12c755eef7382f0e941f63858e5cdb')

package() {
    cp -a "$srcdir/opt" "$pkgdir/opt" 
    cp -a "$srcdir/usr" "$pkgdir/usr"
    for licensefile in opt/renode/licenses/*; do
    	install -Dm644 "$licensefile" "$pkgdir/usr/share/licenses/$pkgname/$licensefile" 
    done
}
