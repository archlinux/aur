# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=rustotpony
pkgver=0.4.1
pkgrel=10
pkgdesc='RusTOTPony — CLI manager of one-time password generators like Google Authenticator'
url='https://github.com/zebradil/rustotpony'
arch=(i686 x86_64 armv6h armv7h)
license=(MIT)
depends=(gcc-libs glibc)
makedepends=(cargo)
conflicts=(rustotpony-bin)
provides=(totp)
source=(rustotpony-0.4.1::https://github.com/zebradil/rustotpony/archive/0.4.1.tar.gz)
build () 
{ 
    cd "${pkgname}-${pkgver}";
    cargo build --release
}
package () 
{ 
    _binname=totp;
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/target/release/${_binname}" "${pkgdir}/usr/bin/${_binname}"
}
sha256sums=('b513d1404ee58bc10196b68a46ad2a5117a15bff45edc4e2565965a3dde87970')
