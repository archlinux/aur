# Maintainer: Maxi Barmetler <maxi.barmetler@gmail.com>

pkgname=falsec-bin
_pkgname=falsec
provides=(falsec)
conflicts=(falsec)
pkgver=0.1.8
pkgrel=1
pkgdesc='Interpreter and compiler for the FALSE language'
url='https://github.com/MixusMinimax/falsec'
license=(MIT)
depends=('gcc-libs' 'glibc' 'nasm' 'binutils')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MixusMinimax/$_pkgname/releases/download/v$pkgver/$pkgname-$pkgver-$CARCH.tar.gz")
b2sums=('81640a3bb6a71f5fdf6e065134874b636d4bab8be80dff6d676cbc8fd22965df0883368094fc30eda199d7053599c6b5fa209c8bea8a13a7d77e6cd9fe47bfdc')
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
