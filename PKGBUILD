# Maintainer: Maxi Barmetler <maxi.barmetler@gmail.com>

pkgname=falsec-bin
_pkgname=falsec
provides=(falsec)
conflicts=(falsec)
pkgver=0.1.5
pkgrel=1
pkgdesc='Interpreter and compiler for the FALSE language'
url='https://github.com/MixusMinimax/falsec'
license=(MIT)
depends=('gcc-libs' 'glibc' 'nasm' 'binutils')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MixusMinimax/$_pkgname/releases/download/v$pkgver/$pkgname-$pkgver-$CARCH.tar.gz")
b2sums=('34f32b027a6a9e418945ff9935f51f79e100da31dbeced20326c4b90f6a380f94195c1f47f5da3e5f8f2ec52cf9fb6b875f9ea7433360ea080938378df451bcf')
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
