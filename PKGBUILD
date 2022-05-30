# Maintainer: weearc <qby19981121@gmail.com>

pkgname=libaxon-bin
_pkgname=libaxon
pkgver=1.0.1
pkgrel=1
pkgdesc='oicq backend'
url='https://github.com/axon-oicq/axon'
license=(Unlicense)
depends=('glibc')
install=${_pkgname}.install
arch=(x86_64)
provides=('axon' 'libaxon')
optdepends=('pidgin: For GUI usage of oicq'
            'finch: For cli usage of oicq'
            'purple-oicq: purple plugin for oicq'
            'purple-oicq-git: purple plugin for ocqi, git version'
            'systemd: For init systemd instead of openrc'
            )
source=("https://github.com/axon-oicq/axon/releases/download/v1.0.1/axon-1.0.1-linux-x86_64"
        "libaxon.install"
        "libaxon@.service"
        "libaxon_user.service")
sha256sums=('edee85740af52652bb2325ad7b1061a3dca101e078a290f515d5c0890ba89928'
            '7272853b3cb6b2a787f394ae803a1d731cdd8c7c552c69445a8f7a2b47ba3ab9'
            'ab5586c4cf93b1cbd77d57c31ce0d3da9d5888301c9b8638dab36e2f71299736'
            'c28f69e0879b560553750adfd7c456cae96d12e4a6cf63d590e28059caab12ad'
            )

package() {
  install -Dm755 axon-${pkgver}-linux-${CARCH} ${pkgdir}/usr/bin/${_pkgname}
  install -Dm644 "libaxon@.service" "${pkgdir}/usr/lib/systemd/system/libaxon@.service"
   install -Dm644 "libaxon_user.service" "${pkgdir}/usr/lib/systemd/user/libaxon.service"
}
