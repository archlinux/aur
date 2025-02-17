# Maintainer: Maxi Barmetler <maxi.barmetler@gmail.com>

pkgname=falsec-bin
_pkgname=falsec
provides=(falsec)
conflicts=(falsec)
pkgver=0.1.2
pkgrel=1
pkgdesc='Interpreter and compiler for the FALSE language'
url='https://github.com/MixusMinimax/falsec'
license=(MIT)
depends=('gcc-libs' 'glibc' 'nasm' 'binutils')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MixusMinimax/$_pkgname/releases/download/v0.1.2/$pkgname-$pkgver-$CARCH.tar.gz")
b2sums=('95c712ad50ff70fb8cce6b351cb5c2161c183151f60ca7cbb5bd25fe5c2fb047ac094be4fb985f4e67c14c3923937db9feb0e9ef38834e1630d261068c8558fd')
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
