# Maintainer:  Edgar Vincent <e-v@posteo.net>
_pkgname=messenger-notify
pkgname=${_pkgname}-bin
pkgrel=1
pkgver=0.2.2
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
source_x86_64=("https://patchouli.sr.ht/builds.sr.ht/artifacts/~e-v/866389/da7cdb490df24ee3/${_pkgname}_x86_64"
               "https://patchouli.sr.ht/builds.sr.ht/artifacts/~e-v/866389/da7cdb490df24ee3/${_pkgname}_x86_64.asc")
source_aarch64=("https://patchouli.sr.ht/builds.sr.ht/artifacts/~e-v/866388/398655b4f2ffc5f7/${_pkgname}_aarch64"
                "https://patchouli.sr.ht/builds.sr.ht/artifacts/~e-v/866388/398655b4f2ffc5f7/${_pkgname}_aarch64.asc")
sha256sums=('32e2615d4ac4e82a2b573ef6bde6ee828a9906bce322ec4e5424dca1bd91fd50')
sha256sums_x86_64=('45b923229df2ffeb869af25c46b76f30f7641a94c4537d0ff0285f248fd50d32'
                  'SKIP')
sha256sums_aarch64=('be2b35fe2a069b23d55097ecfec2362c1a43a0e562e49c619b92738c507d7cef'
                   'SKIP')
validpgpkeys=('D79DB7519A6EDAA6B2C1CFA05636577A997685EF')

package() {
  install -Dm0755 -T "$srcdir/${_pkgname}_${CARCH}" "$pkgdir/usr/bin/${_pkgname}"
  install -Dm0755 -t "$pkgdir/usr/lib/systemd/user/" "$srcdir/${_pkgname}-${pkgver}/${_pkgname}".service
}

# vim:set ts=2 sw=2 et:
