# Maintainer:  Edgar Vincent <e-v@posteo.net>
_pkgname=messenger-notify
pkgname=${_pkgname}-bin
pkgrel=1
pkgver=0.2.3
# See https://julianfairfax.gitlab.io/messenger-notify-prebuilt/version.txt
pkgdesc="A background service that can be connected to messengers (such as Signal and Matrix) and will show a desktop notification on message receive. Binary version."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/Schmiddiii/$_pkgname"
license=('AGPL3')
depends=('gcc-libs'
         'openssl')
optdepends=('waked: for scheduled wake-ups'
           'feedbackd: for vibrating notifications')
provides=("$_pkgname")
conflicts=("${_pkgname}-git")
source=("https://gitlab.com/Schmiddiii/$_pkgname/-/archive/${pkgver}/$_pkgname-${pkgver}.tar.gz")
source_x86_64=("https://julianfairfax.gitlab.io/${_pkgname}-prebuilt/amd64/${_pkgname}"
               "https://julianfairfax.gitlab.io/${_pkgname}-prebuilt/amd64/${_pkgname}.asc")
source_aarch64=("https://julianfairfax.gitlab.io/${_pkgname}-prebuilt/arm64/${_pkgname}"
                "https://julianfairfax.gitlab.io/${_pkgname}-prebuilt/arm64/${_pkgname}.asc")
sha256sums=('f51bedab7042b8efd4b86552b1571b443e4777da3ceba34d3ec1d3075bebe856')
sha256sums_x86_64=('6b5a4a8a9833c27ec3a0643e10bd321853f7d86a5f1b6e96c5c8bb53cb29a0f2'
                  'SKIP')
sha256sums_aarch64=('22445f29f48d0b22d651c06e87842d70ddcea895b9098d8b6c9a96d492a8519d'
                   'SKIP')
validpgpkeys=('C123CB2B21B9F68C80A03AE005B2039A85E7C70A')

package() {
  install -Dm0755 -T "$srcdir/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
  install -Dm0755 -t "$pkgdir/usr/lib/systemd/user/" "$srcdir/${_pkgname}-${pkgver}/${_pkgname}".service
}

# vim:set ts=2 sw=2 et:
