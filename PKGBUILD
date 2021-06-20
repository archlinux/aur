# Maintainer: numToStr <sudo@vikasraj.dev>

pkgname=ky
pkgver=0.1.0
pkgrel=1
pkgdesc='Simple and Secure password manager written in rust'
arch=('x86_64' 'aarch64' 'armv7')
url=https://github.com/numToStr/ky
license=('MIT')
provides=($pkgname)
conflicts=($pkgname)

depends=(
  'pacman<6'
  'sudo'
  'git'
  'tar'
)

source_x86_64=(
    "$url/releases/download/v$pkgver/$pkgname-x86_64-unknown-linux-gnu.tar.gz"
)
md5sums_x86_64=(SKIP)

source_armv7=(
    "$url/releases/download/v$pkgver/$pkgname-armv7-unknown-linux-gnueabihf.tar.gz"
)
md5sums_armv7=(SKIP)

source_aarch64=(
    "$url/releases/download/v$pkgver/$pkgname-aarch64-unknown-linux-gnu.tar.gz"
)
md5sums_aarch64=(SKIP)

package() {
    _output=""
    case $CARCH in
        x86_64 )
            _output="$pkgname-x86_64-unknown-linux-gnu"
            ;;
        armv7 )
            _output="$pkgname-armv7-unknown-linux-gnueabihf"
            ;;
        aarch64 )
            _output="$pkgname-aarch64-unknown-linux-gnu"
            ;;
    esac

	install -Dm755 "${srcdir}/${_output}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
