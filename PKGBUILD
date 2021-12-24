# Maintainer: numToStr <sudo@vikasraj.dev>

pkgname=zenv
pkgver=0.8.0
pkgrel=1
pkgdesc="Dotenv (.env) loader written in rust"
arch=('x86_64' 'aarch64' 'armv7')
url=https://github.com/numToStr/zenv
license=('GPL')
provides=($pkgname)
conflicts=($pkgname)

source_x86_64=(
    "$url/releases/download/$pkgver/$pkgname-$pkgver-x86_64-unknown-linux-gnu.tar.gz"
)
md5sums_x86_64=(SKIP)

source_armv7=(
    "$url/releases/download/$pkgver/$pkgname-$pkgver-armv7-unknown-linux-gnueabihf.tar.gz"
)
md5sums_armv7=(SKIP)

source_aarch64=(
    "$url/releases/download/$pkgver/$pkgname-$pkgver-aarch64-unknown-linux-gnu.tar.gz"
)
md5sums_aarch64=(SKIP)

package() {
    case $CARCH in
        x86_64 )
            _output="$pkgname-$pkgver-x86_64-unknown-linux-gnu"
            ;;
        armv7 )
            _output="$pkgname-$pkgver-armv7-unknown-linux-gnueabihf"
            ;;
        aarch64 )
            _output="$pkgname-$pkgver-aarch64-unknown-linux-gnu"
            ;;
    esac

	install -Dm755 "${srcdir}/${_output}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
