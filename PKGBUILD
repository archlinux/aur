# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=rustotpony
pkgver=0.5.3
pkgrel=2
pkgdesc='RusTOTPony — CLI manager of one-time password generators like Google Authenticator'
url='https://github.com/zebradil/rustotpony'
arch=(i686 x86_64 armv6h armv7h)
license=(MIT)
install=''
options=(!debug !lto)
depends=(gcc-libs glibc)
makedepends=(rust)
conflicts=(rustotpony-bin)
provides=(totp)
source=(rustotpony-0.5.3::https://github.com/zebradil/rustotpony/archive/0.5.3.tar.gz)
build () 
{ 
    set -eo pipefail;
    cd "${pkgname}-${pkgver}";
    cargo build --release
}
package () 
{ 
    set -eo pipefail;
    _binname=totp;
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/target/release/${_binname}" "${pkgdir}/usr/bin/${_binname}"
}
sha256sums=('fa7d810c481f943e3dd3afbc04888ee011557126b22ddce629c1b13aebbbbb41')
