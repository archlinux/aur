# Maintainer: <agustinballesteros04@gmail.com>
pkgname=pinchtab-bin
_pkgname=pinchtab
pkgver=0.15.0
pkgrel=1
pkgdesc="High-performance browser automation bridge and multi-instance orchestrator with advanced stealth injection and real-time dashboard."
arch=('x86_64')
url="https://github.com/pinchtab/pinchtab"
license=('MIT')
depends=('glibc')
provides=("$_pkgname")
conflicts=("$_pkgname")

_license_commit="fe09a076da94ecdbda1967d800b1ba9b6e925d55"

source=(
  "${_pkgname}-linux-amd64::https://github.com/pinchtab/pinchtab/releases/download/v${pkgver}/pinchtab-linux-amd64"
  "LICENSE::https://raw.githubusercontent.com/pinchtab/pinchtab/${_license_commit}/LICENSE"
)

sha256sums=('8bbb81e1f7242a08b225a7d3c557744c614bd4f58dd1d83de5c477a53a4a2674'
            '8e526b04f1f02203eebfd55aead0657a7ae87e0591cf8a44fbee19441aa0f116')


package() {
  cd "${srcdir}"
  install -Dm755 pinchtab-linux-amd64 "$pkgdir/usr/bin/pinchtab"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
