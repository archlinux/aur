# Maintainer: Josh VanderLinden <arch@cloudlery.com>
_appname=baton
pkgname=${_appname}-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="CLI / TUI to remotely manage Spotify playback"
provides=("${_appname}")
arch=('x86_64')
url="https://github.com/joshuathompson/${_appname}"
license=('MIT')
source=(
  "${pkgname}-${pkgver}::https://github.com/joshuathompson/${_appname}/releases/download/${pkgver}/${_appname}_linux_amd64"
  "LICENSE::https://raw.githubusercontent.com/joshuathompson/${_appname}/master/LICENSE"
)
sha256sums=('f508f036eeea1f1eb8a2bc8df5f12b47daefa3094a8d14e1197fd00a28beb46a'
            '3eec9c2f5c8f98f1875dbc57b9a2985313c869456466e09152259a7090f61d20')
options=(!strip)

package() {
  install -Dm755 ../${pkgname}-${pkgver} "${pkgdir}/usr/bin/${_appname}"
  install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et ai:
