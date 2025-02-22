# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=VHSgunzo
_pkgname=combaud
pkgname=${_pkgname}-bin
pkgver=1.0
pkgrel=1
pkgdesc="Broadcasting audio output from applications to a virtual microphone"
arch=('any')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
makedepends=('tar')
depends=('pulse-native-provider' 'grep' 'sed' 'coreutils' 'gawk')
source=("${_urlraw}/combaud"
        "${_urlraw}/LICENSE"
        "${_urlraw}/README.md"
        "${_urlraw}/loop-ignore.list")
sha256sums=('7d1247524fd908e7f5e2883cacf2ed1dfeb22988015cf8412db3e4f383c27747'
            'a4393c8081a50ad24c9247c5ef80109bb1b47dbde393a154d25403f736b62433'
            'c6acb74d0384f93c9d85d1f9a5303c14563b6cd0bb9f354245a9375a86944482'
            '501ffa99aeb044aba432f762119d9f62876d01d97e01e702a1c60fdd206bf725')

package() {
    install -Dm755 'combaud' "$pkgdir/usr/bin/${_pkgname}"
    install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 'README.md' "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 'loop-ignore.list' "${pkgdir}/etc/${_pkgname}/loop-ignore.list"
}
