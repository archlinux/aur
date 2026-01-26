# Maintainer: Maxi Barmetler <maxi.barmetler@gmail.com>

pkgname=falsec-bin
_pkgname=falsec
provides=(falsec)
conflicts=(falsec)
pkgver=0.1.4
pkgrel=1
pkgdesc='Interpreter and compiler for the FALSE language'
url='https://github.com/MixusMinimax/falsec'
license=(MIT)
depends=('gcc-libs' 'glibc' 'nasm' 'binutils')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MixusMinimax/$_pkgname/releases/download/v$pkgver/$pkgname-$pkgver-$CARCH.tar.gz")
b2sums=('b64a4a7566b1c8e29a6fd1deec0d2a6923907253a329883e55854ba5d52435f65ff49bf08487579a0a41cc9f4e488a98a4c6e96e99f62240f9c5e7831be52db0')
options=(!strip !debug)

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "bin/$_pkgname"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 completion/falsec.bash "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
    install -Dm644 completion/falsec.elv "${pkgdir}/usr/share/elvish/lib/${_pkgname}.elv"
    install -Dm644 completion/falsec.fish "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
    install -Dm644 completion/falsec.zsh "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
}
