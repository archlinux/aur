# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=rustotpony
pkgver=0.4.4
pkgrel=2
pkgdesc='RusTOTPony — CLI manager of one-time password generators like Google Authenticator'
url='https://github.com/zebradil/rustotpony'
arch=(i686 x86_64 armv6h armv7h)
license=(MIT)
depends=(gcc-libs glibc)
makedepends=(cargo)
conflicts=(rustotpony-bin)
provides=(totp)
source=(rustotpony-0.4.4::https://github.com/zebradil/rustotpony/archive/0.4.4.tar.gz)
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
sha256sums=('72fadf452acc27601b285fd049c5606cccf7292d8dc5b672e539c3c851b3d0b6')
