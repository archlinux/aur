# Maintainer: Maxi Barmetler <maxi.barmetler@gmail.com>

pkgname=falsec-bin
_pkgname=falsec
provides=(falsec)
conflicts=(falsec)
pkgver=0.1.7
pkgrel=1
pkgdesc='Interpreter and compiler for the FALSE language'
url='https://github.com/MixusMinimax/falsec'
license=(MIT)
depends=('gcc-libs' 'glibc' 'nasm' 'binutils')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MixusMinimax/$_pkgname/releases/download/v$pkgver/$pkgname-$pkgver-$CARCH.tar.gz")
b2sums=('d7230a85684da868b7b7bb4c7c67a0c5c5c5ad80fa713663e421c42c38888eb9683a5d06ac0446f165748f6567909b90b0519230dd144f805597d9c9e7391736')
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
