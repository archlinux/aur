# Maintainer: RangS-1 <rangga19sj@gmail.com>
pkgname=bashing
_repo=Bashing
pkgver=1.0.0
pkgrel=2
pkgdesc="Bash Scripting, such as laravel environment, githelper and more"
arch=('any')
url="https://github.com/RangS-1/Bashing"
license=('MIT')

depends=(
    bash
)

makedepends=(
    
)

source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/RangS-1/${_repo}/archive/refs/tags/v$pkgver.tar.gz"
)

sha256sums=('314ac521b75fb014fbb0407c49e0263f11bc011d20cf81c6530b0ba25cbe9fc9')

package() {
    cd "$srcdir/${_repo}-${pkgver}"

    install -dm755 "$pkgdir/usr/bin"

    for script in *; do
        [[ -d "$script" ]] && continue
        [[ "$script" == "README.md" ]] && continue

        if [[ -x "$script" ]]; then
            install -Dm755 "$script" "$pkgdir/usr/bin/$script"
        fi
    done

    install -Dm644 README.md \
        "$pkgdir/usr/share/doc/$pkgname/README.md"
}
