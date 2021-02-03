# Maintainer: Celogeek <arch-aur-f5d67e@celogeek.com>

_pkgname=fluffychat
pkgname=fluffychat-web
_gitname=${_pkgname}
pkgver=0.26.1
pkgrel=2
pkgdesc="Chat with your friends"
arch=('any')
url="https://fluffychat.im/"
license=('AGPL3')
makedepends=()
optdepends=()
provides=("$pkgname")
conflicts=("$pkgname")
source=(
  "artifact.zip::https://gitlab.com/famedly/fluffychat/-/jobs/artifacts/v${pkgver}/download?job=build_web"
  "config.sample.json::https://gitlab.com/famedly/fluffychat/-/raw/v${pkgver}/config.sample.json"
)
sha256sums=('0b2accd20c4b6c52a48f9782c3ec6044d5a17f0f0d14afb152d77e1b26740397'
            '8540064556b3a952c898023e48afb29e3c560964d66e51bbc422a0061318bd5e')
backup=(
    "etc/webapps/${_pkgname}/config.json"
)

package() {  
  install -dm755 ${pkgdir}/usr/share/webapps
  mv build/web ${pkgdir}/usr/share/webapps/${_pkgname}
  install -Dm644 config.sample.json ${pkgdir}/etc/webapps/${_pkgname}/config.json
  ln -s /etc/webapps/${_pkgname}/config.json ${pkgdir}/usr/share/webapps/${_pkgname}
}

# vim: set sw=2 ts=2 et:
